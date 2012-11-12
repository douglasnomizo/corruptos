# encoding: utf-8
class Candidato < ActiveRecord::Base
  attr_accessible :nome_campanha, :eleitor, :partidos, :candidaturas, :eleitor_id
  belongs_to :eleitor
  has_many :candidaturas
  has_many :partidos, :through => :candidaturas

  accepts_nested_attributes_for :candidaturas
  accepts_nested_attributes_for :eleitor
  accepts_nested_attributes_for :partidos
  
  validates :eleitor, :presence => { :message => "O candidato deve ser um eleitor válido" }
  validates :nome_campanha, :presence => { :message => "Informe o nome de campanha" }
	validates_uniqueness_of :nome_campanha
	validates_length_of :nome_campanha, :in => 5..150
  

  def candidatura
    self.candidaturas.last
  end

end
