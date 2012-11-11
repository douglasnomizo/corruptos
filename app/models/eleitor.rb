# encoding: utf-8
class Eleitor < ActiveRecord::Base
  attr_accessible :cpf, :data_nascimento, :nome, :nome_mae, :rg, :endereco

  has_many :titulos
  has_many :candidatos
  belongs_to :endereco

  accepts_nested_attributes_for :titulos
  
  validates_presence_of :data_nascimento, :nome, :nome_mae, :rg, :endereco_id, :message => "Campo não pode ser em branco"
  validate :cpf, :numericality => :true
  validate :valid_date?


  def as_json(options={})
    { :cpf => self.cpf, 
      :data_nascimento => self.data_nascimento.strftime('%d/%m/%Y'), 
      :endereco => self.endereco.descricao,
      :nome => self.nome,
      :nome_mae => self.nome_mae,
      :rg => self.rg,
      :id => self.id }
  end

  private 

	def valid_date?
		sixteen_years_ago = Date.today
		16.times { sixteen_years_ago = sixteen_years_ago.prev_year }
		if data_nascimento > sixteen_years_ago
			errors.add(:data_nascimento, "Eleitor deve possuir no mínimo 16 anos!")
		end
  end  
end
