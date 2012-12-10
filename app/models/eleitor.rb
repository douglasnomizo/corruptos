# encoding: utf-8
class Eleitor < ActiveRecord::Base
attr_accessible :nome, :rg, :cpf, :data_nascimento, :endereco_attributes, :nome_mae, :titulo_attributes, :endereco_id
  has_one :titulo
  has_one :candidato
  belongs_to :endereco

  accepts_nested_attributes_for :titulo, :endereco

  validates_presence_of :data_nascimento, :nome, :nome_mae, :rg, :endereco_id, message: "Campo não pode ser em branco"
  validates_uniqueness_of :cpf, :rg
  validates :rg, length: {in: 5..20}
  validates :cpf, cpf: true
  validate :cpf, numericality: true
  validate :valid_date?
  before_save :limpa_cpf


  def as_json(options={})
    { cpf: self.cpf,
      data_nascimento: self.data_nascimento.strftime('%d/%m/%Y'),
      endereco: self.endereco.descricao,
      nome: self.nome,
      nome_mae: self.nome_mae,
      rg: self.rg,
      id: self.id }
  end

  private

	def valid_date?
    if self.data_nascimento
  		sixteen_years_ago = Date.today
  		16.times { sixteen_years_ago = sixteen_years_ago.prev_year }
      if self.data_nascimento > sixteen_years_ago
  			errors.add(:data_nascimento, "Eleitor deve possuir no mínimo 16 anos!")
  		end
    end
  end

  def limpa_cpf
    self.cpf = self.cpf.gsub(/\D/, '')
  end
end
