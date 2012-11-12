class Uf < ActiveRecord::Base
	has_many :municipios
	has_many :enderecos, :through => :municipios

	accepts_nested_attributes_for :municipios
	
  attr_accessible :nome, :sigla, :municipios

  validates_presence_of :nome, :sigla
end
