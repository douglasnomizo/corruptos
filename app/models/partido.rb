class Partido < ActiveRecord::Base
  attr_accessible :nome, :sigla, :numero

  has_and_belongs_to_many :coligacaos

  validates_presence_of :nome, :sigla, :numero
  validates_uniqueness_of :nome, :sigla, :numero
end
