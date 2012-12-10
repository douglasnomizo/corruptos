# encoding: utf-8
class Coligacao < ActiveRecord::Base
  belongs_to :cargo_eleicao
  has_many :coligacao_partidos
  has_many :partidos, through: :coligacao_partidos

  attr_accessible :nome, :cargo_eleicao_id, :partido_ids

  validate do |coligacao|
    coligacao.errors[:base] << "Cargo indisponível para essa eleição!" if coligacao.cargo_eleicao.blank?
  end

  validates :nome, presence: true, length: {in: 5..55}
  validates_uniqueness_of :nome
  validate :valida_qtd_partidos
  validate :valida_partidos_nao_coligados

  def valida_qtd_partidos
    errors.add(:base, "Selecione 2 ou mais partidos para formar uma coligação!") if partidos.size < 2
  end

  def valida_partidos_nao_coligados
    p_ids = Coligacao.where(cargo_eleicao_id: self.cargo_eleicao_id).map {|e| e.partido_ids }
    p_ids.flatten!.uniq!
    partidos_invalidos = self.partido_ids - p_ids
    if partidos_invalidos.size > 0 
      msg = ""
      partidos_invalidos.each do |pi|
        msg += Partido.find(pi).nome + ", "
      end
      msg += "já coligado(s) para o cargo selecionado!"
      errors.add(:base, msg)
    end
  end
end
