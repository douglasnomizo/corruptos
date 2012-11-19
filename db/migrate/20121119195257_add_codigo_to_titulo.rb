class AddCodigoToTitulo < ActiveRecord::Migration
  def change
    add_column :titulos, :codigo, :integer
  end
end
