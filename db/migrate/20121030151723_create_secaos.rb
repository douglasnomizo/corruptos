class CreateSecaos < ActiveRecord::Migration
  def change
    create_table :secaos do |t|
      t.integer :limite_eleitores
      t.references :zona

      t.timestamps
    end
    add_index :secaos, :zona_id
  end
end
