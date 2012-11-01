class Partido < ActiveRecord::Base
  attr_accessible :nome, :sigla

  validates_presence_of :nome, :sigla
end
