class Zona < ActiveRecord::Base
  belongs_to :endereco
  has_many :secaos, order: 'codigo ASC'

  attr_accessible :id, :descricao, :endereco_id, :endereco

  validates_presence_of :descricao, :endereco
end
