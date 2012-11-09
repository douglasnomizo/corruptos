# encoding: utf-8
class Candidato < ActiveRecord::Base
  attr_accessible :nome_campanha, :eleitor_id
  belongs_to :eleitor
  has_many :candidaturas
  has_many :partido, :through => :candidaturas
  
  validates :eleitor, :presence => { :message => "O candidato deve ser um eleitor válido" }
  validates :nome_campanha, :presence => { :message => "Informe o nome de campanha" }
	validates_uniqueness_of :nome_campanha
	validates_length_of :nome_campanha, :in => 5..150
  

end
