# encoding: utf-8
class Endereco < ActiveRecord::Base
  belongs_to :municipio
  attr_accessible :bairro, :cep, :complemento, :tipo_logradouro, :logradouro, :numero, :municipio_id

  validates_presence_of :cep, :bairro, :tipo_logradouro, :logradouro, :municipio
  validates_numericality_of :cep, :numero
  #validates :cep, :length => { :minimum => 8, :maximum => 8 }

  def descricao
  	descricao = ""
  	descricao += self.tipo_logradouro if self.tipo_logradouro
  	descricao += " " + self.logradouro if self.logradouro
  	descricao += " nº " + self.numero if self.numero
  	descricao += " " + self.bairro if self.bairro
  	descricao += " " + self.municipio.nome if self.municipio
		descricao += " - " + self.municipio.uf.nome if self.municipio and self.municipio.uf
		return descricao
  end

end
