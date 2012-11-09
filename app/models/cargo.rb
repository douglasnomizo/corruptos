class Cargo < ActiveRecord::Base
  attr_accessible :nome
  has_many :cargo_eleicaos
  has_many :eleicaos, :through => :cargo_eleicaos

  validates :nome, :presence => true, :uniqueness => true
end
