class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :nome
      t.string :rg
      t.string :cpf

      t.timestamps
    end
  end
end
