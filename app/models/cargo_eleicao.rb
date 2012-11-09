class CargoEleicao < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :eleicao
  has_one :coligacao

  # Deve possuir uf ou município ou vazio (presidente) 
  belongs_to :municipio
  belongs_to :uf

  attr_accessible :vagas, :cargo_id, :eleicao_id, :uf_id, :municipio_id

  validates_presence_of :cargo, :eleicao
  
end
