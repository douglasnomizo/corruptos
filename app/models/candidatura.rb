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
  validates_uniqueness_of :codigo_candidato, scope: :cargo_eleicao_id
  validates :codigo_candidato, numericality: { greater_than_or_equal_to: 0 }  
  validates :codigo_candidato, length: {in: 3..7}
  validate :candidato_unico?
  validate :cargo_existe?

  private

  def candidato_unico?
    cargos_ids = Eleicao.find(:first, conditions: "status = true").cargo_eleicaos.map(&:id)
   	candidatura = Candidatura.find(:first, conditions: ["candidato_id = ? and cargo_eleicao_id in (?)", self.candidato_id, cargos_ids])
   	errors.add(:candidato_id, "Candidato já cadastrado para esta eleição!") if candidatura
  end

  def cargo_existe?
    cargo_existe = CargoEleicao.find(self.cargo_eleicao_id) if self.cargo_eleicao_id
    errors.add(:cargo_eleicao_id, "Cargo inexistente para esta eleição em seu endereço") unless cargo_existe
  end
end
