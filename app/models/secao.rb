class Secao < ActiveRecord::Base
  has_many :votos_urnas
  belongs_to :zona
  attr_accessible :limite_eleitores, :zona_id, :codigo

  validates_presence_of :zona_id, :codigo

  def as_json(options={})
  	{ :id => self.id, :codigo => self.codigo }
  end
end
