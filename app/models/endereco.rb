# encoding: utf-8
class Endereco < ActiveRecord::Base
  attr_accessible :bairro, :cep, :complemento, :tipo_logradouro, :logradouro, :numero, :municipio_id

  belongs_to :municipio
  has_one :eleitor

  validates_presence_of :municipio
  validates :cep, :numericality => true
  validates :numero, :numericality => true, :allow_nil => true

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
