# encoding: utf-8
class Candidatura < ActiveRecord::Base
  belongs_to :candidato
  belongs_to :cargo_eleicao
  belongs_to :partido
  attr_accessible :codigo_candidato, :candidato, :cargo_eleicao, :partido, :partido_id, :candidato_id, :cargo_eleicao_id

  accepts_nested_attributes_for :candidato
  accepts_nested_attributes_for :cargo_eleicao
  accepts_nested_attributes_for :partido

  validates_presence_of :candidato_id, :cargo_eleicao_id, :partido_id, :codigo_candidato
  #validate :candidato_unico?

  private

  #def candidato_unico?
  #  cargos_ids = Eleicao.find(:first, :conditions => "status = true").cargo_eleicaos.map(&:id)
  # 	candidatura = Candidatura.find(:first, :conditions => ["candidato_id = ? and cargo_eleicao in (?)", self.candidato_id, cargos_ids])
  # 	errors.add(:candidato_id, "Candidato já adicionado para está eleição!") if candidatura
  # end
end
