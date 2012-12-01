# encoding: utf-8
class RelatoriosController < ApplicationController
  def index
  end

  def gerar

  end

  def uf_municipio
  	if params[:municipio]
  	end
  	render layout: false
  end

  def zona_secao
  	render layout: false
  end

  def candidato
  	render layout: false
  end
end
