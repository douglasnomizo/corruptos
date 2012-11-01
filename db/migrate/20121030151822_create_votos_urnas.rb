class CreateVotosUrnas < ActiveRecord::Migration
  def change
    create_table :votos_urnas do |t|
      t.references :secao
      t.references :candidatura
      t.integer :qtd_votos

      t.timestamps
    end
    add_index :votos_urnas, :secao_id
    add_index :votos_urnas, :candidatura_id
  end
end
