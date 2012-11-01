class Candidato < ActiveRecord::Base
  attr_accessible :nome_campanha, :eleitor_id
  belongs_to :eleitor

  validates_presence_of :eleitor, :nome_campanha
  validates_length_of :nome_campanha, :minimun => 5
  validates_uniqueness_of :nome_campanha

end
