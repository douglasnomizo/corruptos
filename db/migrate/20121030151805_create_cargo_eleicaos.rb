class CreateCargoEleicaos < ActiveRecord::Migration
  def change
    create_table :cargo_eleicaos do |t|
      t.references :cargo
      t.references :eleicao
      t.references :municipio
      t.references :uf
      t.integer :vagas

      t.timestamps
    end
    add_index :cargo_eleicaos, :cargo_id
    add_index :cargo_eleicaos, :eleicao_id
    add_index :cargo_eleicaos, :municipio_id
    add_index :cargo_eleicaos, :uf_id
  end
end
