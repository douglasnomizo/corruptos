class Titulo < ActiveRecord::Base
  attr_accessible :data_emissao, :juiz_eleitoral, :eleitor_id, :secao_id, :status

  belongs_to :eleitor
  belongs_to :secao

  validates_presence_of :data_emissao, :juiz_eleitoral, :eleitor_id, :secao_id

  before_save :cancela_titulo_anterior

  private

  def cancela_titulo_anterior
  	titulos = Titulo.find(:all, :conditions => ["eleitor_id = ?", self.eleitor_id])
  	if titulos
  		titulos.each do |t|
  			t.status = false
  			t.save
  		end
  	end
  end
end
