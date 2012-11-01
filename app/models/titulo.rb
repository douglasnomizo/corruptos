class Titulo < ActiveRecord::Base
  belongs_to :eleitor
  belongs_to :secao
  attr_accessible :data_emissao, :juiz_eleitoral, :status

  validates_presence_of :data_emissao, :juiz_eleitoral, :eleitor, :secao
end
