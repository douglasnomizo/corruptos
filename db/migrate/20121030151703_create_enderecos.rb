class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.references :municipio
      t.string :logradouro
      t.integer :numero
      t.string :bairro
      t.string :cep
      t.string :complemento

      t.timestamps
    end
    add_index :enderecos, :municipio_id
  end
end
