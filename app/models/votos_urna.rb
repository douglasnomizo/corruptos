class VotosUrna < ActiveRecord::Base
  attr_accessible :qtd_votos, :secao_id, :candidatura_id
	belongs_to :secao
  belongs_to :candidatura

  validates_presence_of :secao_id, :candidatura_id, :qtd_votos
  validates_numericality_of :qtd_votos
end
