class PreencheCargos < ActiveRecord::Migration
  def up
  	Cargo.create(:nome => "Presidente")
  	Cargo.create(:nome => "Prefeito")
  	Cargo.create(:nome => "Governador")
  	Cargo.create(:nome => "Deputado Estadual")
  	Cargo.create(:nome => "Deputado Federal")
  	Cargo.create(:nome => "Senador")
  	Cargo.create(:nome => "Vereador")
  end

  def down
  	Cargo.delete_all
  end
end
