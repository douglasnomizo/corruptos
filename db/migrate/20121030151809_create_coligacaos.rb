class CreateColigacaos < ActiveRecord::Migration
  def change
    create_table :coligacaos do |t|
      t.references :cargo_eleicao
      t.string :nome

      t.timestamps
    end
    add_index :coligacaos, :cargo_eleicao_id
  end
end
