class ColigacaoPartido < ActiveRecord::Base
	attr_accessible :coligacao_id, :partido_id

  belongs_to :coligacao
  belongs_to :partido

  validates_presence_of :coligacao_id, :partido_id
end
