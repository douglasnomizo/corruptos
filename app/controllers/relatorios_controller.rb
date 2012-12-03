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
      @votos = VotosUrna.find(:all, conditions: ["secao_id = ?", secao.id])
    else
      @header = "Seção não recebeu nenhum voto!"
    end
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
    @total_votos = ''
  end
end
