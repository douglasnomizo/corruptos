class Eleicao < ActiveRecord::Base
  attr_accessible :ano, :status

  validates_presence_of :ano
  validates_uniqueness_of :status, :if => :status
end
