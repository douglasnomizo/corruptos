class CreateUfs < ActiveRecord::Migration
  def change
    create_table :ufs do |t|
      t.string :sigla
      t.string :nome

      t.timestamps
    end
  end
end
