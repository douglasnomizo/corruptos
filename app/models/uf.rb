class Uf < ActiveRecord::Base
	has_many :municipios
	accepts_nested_attributes_for :municipios
	
  attr_accessible :nome, :sigla

  validates_presence_of :nome, :sigla
end
