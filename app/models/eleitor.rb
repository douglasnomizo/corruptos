# encoding: utf-8
class Eleitor < ActiveRecord::Base
  attr_accessible :cpf, :data_nascimento, :nome, :nome_mae, :rg, :endereco_id

  belongs_to :endereco
  has_many :titulos

  accepts_nested_attributes_for :titulos
  
  validates_presence_of :data_nascimento, :nome, :nome_mae, :rg, :message => "Campo não pode ser em branco"
  validate :cpf, :numericality => :true
  validate :valid_date?

  private 

	def valid_date?
		sixteen_years_ago = Date.today
		16.times { sixteen_years_ago = sixteen_years_ago.prev_year }
		if data_nascimento > sixteen_years_ago
			errors.add(:data_nascimento, "Eleitor deve possuir no mínimo 16 anos!")
		end
  end  
end
