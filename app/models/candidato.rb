# encoding: utf-8
class Candidato < ActiveRecord::Base
  attr_accessible :nome_campanha, :eleitor_id, :partido, :candidatura_attributes
  belongs_to :eleitor
  has_one :candidatura
  has_one :partido, :through => :candidatura
  attr_accessor :cpf, :eleitors

  accepts_nested_attributes_for :candidatura
  accepts_nested_attributes_for :eleitor
  accepts_nested_attributes_for :partido

  validates :eleitor, :presence => { :message => "O candidato deve ser um eleitor válido" }
  validates :nome_campanha, :presence => { :message => "Informe o nome de campanha" }
	validates_uniqueness_of :nome_campanha
	validates_length_of :nome_campanha, :in => 5..150
end