class CreateEleicaos < ActiveRecord::Migration
  def change
    create_table :eleicaos do |t|
      t.integer :ano
      t.boolean :status

      t.timestamps
    end
  end
end
