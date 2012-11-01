class AddNomeCampanhaAndEleitorToCandidato < ActiveRecord::Migration
  def change
    add_column :candidatos, :nome_campanha, :string
    add_column :candidatos, :eleitor_id, :integer
    add_index :candidatos, :eleitor_id
  end
end
