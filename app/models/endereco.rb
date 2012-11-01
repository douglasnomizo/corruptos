class Endereco < ActiveRecord::Base
  belongs_to :municipio
  attr_accessible :bairro, :cep, :complemento, :tipo_logradouro, :logradouro, :numero

  validates_presence_of :cep, :bairro, :tipo_logradouro, :logradouro, :municipio
  validates_numericality_of :cep, :numero
  validates_length_of :cep, :minimum => 8, :maximum => 8
end
