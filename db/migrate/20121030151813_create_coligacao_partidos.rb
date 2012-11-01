class CreateColigacaoPartidos < ActiveRecord::Migration
  def change
    create_table :coligacao_partidos do |t|
      t.references :coligacao
      t.references :partido

      t.timestamps
    end
    add_index :coligacao_partidos, :coligacao_id
    add_index :coligacao_partidos, :partido_id
  end
end
