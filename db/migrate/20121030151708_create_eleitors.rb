class CreateEleitors < ActiveRecord::Migration
  def change
    create_table :eleitors do |t|
      t.string :nome
      t.string :nome_mae
      t.string :rg
      t.date :data_nascimento
      t.string :cpf
      t.references :endereco

      t.timestamps
    end
    add_index :eleitors, :endereco_id
  end
end
