class Coligacao < ActiveRecord::Base
  belongs_to :cargo_eleicao
  has_many :coligacao_partidos

  attr_accessible :nome

  validates_presence_of :cargo_eleicao, :nome
end
