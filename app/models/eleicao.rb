class Eleicao < ActiveRecord::Base
  attr_accessible :ano, :status, :cargos

  has_many :cargo_eleicaos
  has_many :cargos, :through => :cargo_eleicaos

  validates_presence_of :ano
  validates_uniqueness_of :status, :if => :status
end
