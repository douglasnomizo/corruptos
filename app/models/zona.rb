class Zona < ActiveRecord::Base
  belongs_to :endereco
  has_many :secaos

  attr_accessible :id, :descricao, :endereco_id

  validates_presence_of :descricao, :endereco
end