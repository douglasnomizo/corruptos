class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.references :uf
      t.string :nome

      t.timestamps
    end
    add_index :municipios, :uf_id
  end
end
