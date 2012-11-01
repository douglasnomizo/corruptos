class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.references :endereco

      t.timestamps
    end
    add_index :zonas, :endereco_id
  end
end
