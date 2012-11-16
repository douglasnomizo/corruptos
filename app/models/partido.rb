class Partido < ActiveRecord::Base
  attr_accessible :nome, :sigla, :numero, :candidatos, :candidaturas

  has_many :candidaturas
  has_many :coligacao_partidos
  has_many :candidatos, through: :coligacao_partidos

  has_and_belongs_to_many :coligacaos

  validates_presence_of :nome, :sigla, :numero
  validates_uniqueness_of :nome, :sigla, :numero
end
