class Titulo < ActiveRecord::Base
  attr_accessible :data_emissao, :juiz_eleitoral, :eleitor_id, :secao_id, :status, :codigo

  belongs_to :eleitor
  belongs_to :secao

  validates_presence_of :data_emissao, :juiz_eleitoral, :secao_id

  after_save :cancela_titulo_anterior

  private

  def cancela_titulo_anterior
  	ActiveRecord::Base.connection.execute "UPDATE titulos SET status = false where eleitor_id is null"
  end
end
