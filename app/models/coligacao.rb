class Coligacao < ActiveRecord::Base
  belongs_to :cargo_eleicao
  has_many :coligacao_partidos
  has_and_belongs_to_many :partidos

  attr_accessible :nome

  validates_presence_of :cargo_eleicao, :nome
  validates_uniqueness_of :nome
end
