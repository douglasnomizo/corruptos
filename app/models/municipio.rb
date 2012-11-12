class Municipio < ActiveRecord::Base
	has_many :enderecos
  belongs_to :uf

  accepts_nested_attributes_for :enderecos
  attr_accessible :nome, :uf_id

  validates_presence_of :nome, :uf

  def as_json(options={})
    { :id => self.id, :nome => self.nome }
  end

  def cidade_uf
    descricao = ""
    descricao += self.nome
    descricao += "/" + self.uf.nome if self.uf
    return descricao
  end
end
