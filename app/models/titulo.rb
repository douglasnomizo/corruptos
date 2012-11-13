class Titulo < ActiveRecord::Base
  belongs_to :eleitor
  belongs_to :secao
  attr_protected :id

  validates_presence_of :data_emissao, :juiz_eleitoral, :eleitor, :secao
end
