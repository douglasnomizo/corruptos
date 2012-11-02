# encoding:utf-8
class PreenchePartidosPoliticos < ActiveRecord::Migration
  def up
  	Partido.create(:nome => "Democratas",																			:sigla => "DEM", 			:numero => 25)
		Partido.create(:nome => "Partido Comunista Brasileiro",										:sigla => "PCB", 			:numero => 21)
		Partido.create(:nome => "Partido Comunista do Brasil", 										:sigla => "PC do B", 	:numero => 65)
		Partido.create(:nome => "Partido da Causa Operária",											:sigla => "PCO", 			:numero => 29)
		Partido.create(:nome => "Partido da Mobilização Nacional",								:sigla => "PMN", 			:numero => 33)
		Partido.create(:nome => "Partido da República",														:sigla => "PR", 			:numero => 22)
		Partido.create(:nome => "Partido da Social Democracia Brasileira",				:sigla => "PSDB", 		:numero => 45)
		Partido.create(:nome => "Partido Democrático Trabalhista",								:sigla => "PDT", 			:numero => 12)
		Partido.create(:nome => "Partido do Movimento Democrático Brasileiro",		:sigla => "PMDB", 		:numero => 15)
		Partido.create(:nome => "Partido dos Trabalhadores",											:sigla => "PT", 			:numero => 13)
		Partido.create(:nome => "Partido Ecológico Nacional",											:sigla => "PEN", 			:numero => 51)
		Partido.create(:nome => "Partido Humanista da Solidariedade",							:sigla => "PHS", 			:numero => 31)
		Partido.create(:nome => "Partido Popular Socialista",											:sigla => "PPS", 			:numero => 23)
		Partido.create(:nome => "Partido Progressista",														:sigla => "PP", 			:numero => 11)
		Partido.create(:nome => "Partido Pátria Livre",														:sigla => "PPL", 			:numero => 54)
		Partido.create(:nome => "Partido Renovador Trabalhista Brasileiro",				:sigla => "PRTB", 		:numero => 28)
		Partido.create(:nome => "Partido Republicano Brasileiro",									:sigla => "PRB", 			:numero => 10)
		Partido.create(:nome => "Partido Republicano Progressista",								:sigla => "PRP", 			:numero => 44)
		Partido.create(:nome => "Partido Social Cristão",													:sigla => "PSC", 			:numero => 20)
		Partido.create(:nome => "Partido Social Democrata Cristão",								:sigla => "PSDC", 		:numero => 27)
		Partido.create(:nome => "Partido Social Democrático",											:sigla => "PSD", 			:numero => 55)
		Partido.create(:nome => "Partido Social Liberal",													:sigla => "PSL", 			:numero => 17)
		Partido.create(:nome => "Partido Socialismo e Liberdade",									:sigla => "PSOL", 		:numero => 50)
		Partido.create(:nome => "Partido Socialista Brasileiro",									:sigla => "PSB", 			:numero => 40)
		Partido.create(:nome => "Partido Socialista dos Trabalhadores Unificado",	:sigla => "PSTU", 		:numero => 16)
		Partido.create(:nome => "Partido Trabalhista Brasileiro",									:sigla => "PTB", 			:numero => 14)
		Partido.create(:nome => "Partido Trabalhista Cristão",										:sigla => "PTC", 			:numero => 36)
		Partido.create(:nome => "Partido Trabalhista do Brasil", 									:sigla => "PT do B", 	:numero => 70)
		Partido.create(:nome => "Partido Trabalhista Nacional",										:sigla => "PTN", 			:numero => 19)
  end

  def down
  	Partido.delete_all
  end
end
