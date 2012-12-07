# encoding: utf-8
class RelatoriosController < ApplicationController
  layout 'relatorios'

  def index
    render layout: 'application'
  end

  def secao
    secao = Secao.find(params[:id])
    @votos = []
    if secao
      @header = "Seção " + secao.codigo.to_s + " da Zona " + secao.zona.descricao + " de " + secao.zona.endereco.municipio.nome
      @votos = VotosUrna.find(:all, conditions: ["secao_id = ?", secao.id], order: "candidatura_id ASC")
    else
      @header = "Seção não recebeu nenhum voto!"
    end

    @votos = @votos.sort_by {|v| v.qtd_votos}.reverse
  end

  def municipio
    endereco = Endereco.find(:first, conditions: ["municipio_id = ?", params[:id]])
    zonas = endereco.zonas
    @votos = []

    if zonas
      @header = "Votos do município de " + endereco.municipio.nome
      zonas.each do |z|
        @votos << VotosUrna.find(:all, conditions: ["secao_id in (?)", z.secaos.map { |s| s.id }])
      end
    else
      @header = "O município de " + endereco.municipio.nome + " não participou da eleição!"
    end
    @votos.flatten!

    @candidatos = {}
    @votos.each do |v|
      if @candidatos[v.candidatura.id]
        @candidatos[v.candidatura.id]["qtd_votos"] += v.qtd_votos
      else
        @candidatos[v.candidatura.id] = v
      end
    end
    @candidatos = @candidatos.sort_by {|k,v| v.qtd_votos}.reverse
  end

  def zona
    zona = Zona.find(params[:id])
    @votos = []
    if secao
      @header = "Zona " + zona.descricao + " de " + zona.endereco.municipio.nome
      @votos = VotosUrna.find(:all, conditions: ["secao_id in (?)", zona.secaos.map { |s| s.id }])
    else
      @header = "Zona não recebeu nenhum voto!"
    end

    @secoes = {}
    @votos.each do |v|
      if @secoes[v.secao_id]
        @secoes[v.secao_id] << v
      else
        @secoes[v.secao_id] = [v]
      end
    end

    @secoes.each do |k,v|
      @secoes[k] = v.sort { |x, y| x.qtd_votos <=> y.qtd_votos }.reverse
    end
  end

  def candidato
  	eleitor = Eleitor.find(:first, conditions: ["cpf = ?", params[:cpf]])
    @votos = []
    if eleitor and eleitor.candidato
      @header = "Votos do Candidato: \"" + eleitor.candidato.nome_campanha + "\""
      @votos = VotosUrna.find(:all, conditions: ["candidatura_id = ?", eleitor.candidato.candidatura.id])
    else
      @header = "Candidato não encontrado!"
    end
    @total_votos = 0
    @votos.each do |v|
      @total_votos += v.qtd_votos
    end
  end
end