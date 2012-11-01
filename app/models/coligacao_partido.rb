class ColigacaoPartido < ActiveRecord::Base
  belongs_to :coligacao
  belongs_to :partido

  validates_presence_of :coligacao, :partido
end
