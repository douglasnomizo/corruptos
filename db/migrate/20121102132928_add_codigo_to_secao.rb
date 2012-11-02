class AddCodigoToSecao < ActiveRecord::Migration
  def change
    add_column :secaos, :codigo, :integer
  end
end
