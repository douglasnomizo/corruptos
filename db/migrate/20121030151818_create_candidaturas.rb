class CreateCandidaturas < ActiveRecord::Migration
  def change
    create_table :candidaturas do |t|
      t.references :candidato
      t.references :cargo_eleicao
      t.references :partido
      t.integer :codigo_candidato

      t.timestamps
    end
    add_index :candidaturas, :candidato_id
    add_index :candidaturas, :cargo_eleicao_id
    add_index :candidaturas, :partido_id
  end
end
