class Candidatura < ActiveRecord::Base
  belongs_to :candidato
  belongs_to :cargo_eleicao
  belongs_to :partido
  attr_accessible :codigo_candidato, :candidato, :cargo_eleicao, :partido

  validates_presence_of :candidato, :cargo_eleicao, :partido, :codigo_candidato
end
