class AddDescricaoToZona < ActiveRecord::Migration
  def change
    add_column :zonas, :descricao, :string
  end
end
