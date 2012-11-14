class Titulo < ActiveRecord::Base
  attr_accessible :data_emissao, :juiz_eleitoral, :eleitor_id, :secao_id, :status

  belongs_to :eleitor
  belongs_to :secao

  validates_presence_of :data_emissao, :juiz_eleitoral, :secao_id

  before_save :cancela_titulo_anterior

  private

  def cancela_titulo_anterior
  	titulos = Titulo.find(:all, :conditions => ["eleitor_id is null and id <> ?", self.id])
  	if titulos.size > 0
  		titulos.each do |t|
  			t.status = false
  			t.save!
  		end
  	end
  end
end
