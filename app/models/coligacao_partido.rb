class ColigacaoPartido < ActiveRecord::Base
	attr_accessible :coligacao_id, :partido_id

  belongs_to :coligacao
  belongs_to :partido

  validates_uniqueness_of :coligacao_id, scope: :partido_id
  validates_presence_of :coligacao_id, :partido_id
end
