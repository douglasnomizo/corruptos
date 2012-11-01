class CargoEleicao < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :eleicao

  # Deve possuir uf ou município ou vazio (presidente) 
  belongs_to :municipio
  belongs_to :uf

  attr_accessible :vagas

  validates_presence_of :cargo, :eleicao
  
end
