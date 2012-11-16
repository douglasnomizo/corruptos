class Coligacao < ActiveRecord::Base
  belongs_to :cargo_eleicao
  has_many :coligacao_partidos
  has_and_belongs_to_many :partidos

  attr_accessible :nome, :cargo_eleicao_id

  validates_presence_of :cargo_eleicao, :nome
  validates_uniqueness_of :nome
  #validates_uniqueness_of :cargo_eleicao_id, scope: :partidos, message: "partido já coligado para este cargo!"
end
