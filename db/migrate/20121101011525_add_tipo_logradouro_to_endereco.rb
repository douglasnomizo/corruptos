class AddTipoLogradouroToEndereco < ActiveRecord::Migration
  def change
    add_column :enderecos, :tipo_logradouro, :string
  end
end
