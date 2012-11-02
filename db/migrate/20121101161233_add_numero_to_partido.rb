class AddNumeroToPartido < ActiveRecord::Migration
  def change
    add_column :partidos, :numero, :integer
  end
end
