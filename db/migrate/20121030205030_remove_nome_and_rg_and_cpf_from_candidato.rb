class RemoveNomeAndRgAndCpfFromCandidato < ActiveRecord::Migration
  def up
  	 remove_column :candidatos, :nome
  	 remove_column :candidatos, :rg
  	 remove_column :candidatos, :cpf
  end

  def down
  	add_column :candidatos, :nome, :string
  	add_column :candidatos, :rg, :string
  	add_column :candidatos, :cpf, :string
  end
end
