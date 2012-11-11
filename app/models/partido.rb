class Partido < ActiveRecord::Base
  attr_accessible :nome, :sigla, :numero, :candidatos, :candidaturas

  has_many :candidaturas
  has_many :candidatos, :through => :candidaturas
  has_and_belongs_to_many :coligacaos

  validates_presence_of :nome, :sigla, :numero
  validates_uniqueness_of :nome, :sigla, :numero
end
