class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
