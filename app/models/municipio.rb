class Municipio < ActiveRecord::Base
	has_many :enderecos
  belongs_to :uf

  accepts_nested_attributes_for :enderecos
  attr_accessible :nome

  validates_presence_of :nome, :uf
end
