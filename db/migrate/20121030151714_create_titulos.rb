class CreateTitulos < ActiveRecord::Migration
  def change
    create_table :titulos do |t|
      t.date :data_emissao
      t.string :juiz_eleitoral
      t.boolean :status
      t.references :eleitor
      t.references :secao

      t.timestamps
    end
    add_index :titulos, :eleitor_id
    add_index :titulos, :secao_id
  end
end
