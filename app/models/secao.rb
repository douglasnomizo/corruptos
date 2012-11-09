class Secao < ActiveRecord::Base
  belongs_to :zona
  attr_accessible :limite_eleitores, :zona_id, :codigo

  validates_presence_of :zona_id, :codigo
end
