class VotosUrna < ActiveRecord::Base
  belongs_to :secao
  belongs_to :candidatura
  attr_accessible :qtd_votos

  validates_presence_of :secao, :candidatura, :qtd_votos
  validates_numericality_of :qtd_votos
end
