# encoding: utf-8
class RelatoriosController < ApplicationController
  def index
  end

  def uf_municipio
  	if params[:municipio]
  		ce = CargoEleicao.where(municipio_id: params[:municipio])
  		ca = Candidatura.where(cargo_eleicao_id: ce)
  		vu = VotosUrna.where()
  	else
  	end
  end

  def zona_secao

  end

  def candidato

  end
end
