class AddDataToEleicaos < ActiveRecord::Migration
  def change
    add_column :eleicaos, :data, :date
  end
end
