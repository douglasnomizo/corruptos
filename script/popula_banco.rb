puts "Gerando Votos"

eleicao = Eleicao.where(status: true).first
cargos_eleicao = CargoEleicao.where(eleicao_id: eleicao.id)
cargos_eleicao.each do |ce|
	candidaturas = Candidatura.find(:all, conditions: ["cargo_eleicao_id = ?", ce.id])
	secoes.each do |s|
		limite = 200
		candidaturas.each do |c|
			votos = rand(limite)
			vu = VotosUrna.create(secao_id: s.id, candidatura_id: c.id, qtd_votos: votos)
			limite -= votos
		end
	end
end


# if cargo.nome.eql? "Presidente"
# 	CargoEleicao.create(cargo_id: cargo.id, vagas: 1, eleicao_id: eleicao.id)
# elsif cargo.nome.eql? "Governador"
# 	Uf.all.each do |uf|
# 		CargoEleicao.create(cargo_id: cargo.id, vagas: 1, eleicao_id: eleicao.id, uf_id: uf.id)
# 	end
# elsif cargo.nome.eql? "Senador"
# 	Uf.all.each do |uf|
# 		CargoEleicao.create(cargo_id: cargo.id, vagas: 3, eleicao_id: eleicao.id, uf_id: uf.id)
# 	end
# elsif cargo.nome.eql? "Deputado Federal"
# 	Uf.all.each do |uf|
# 		qtde_vagas = 9 + rand(62) # mínimo 8 e máximo 70
# 		CargoEleicao.create(cargo_id: cargo.id, vagas: qtde_vagas, eleicao_id: eleicao.id, uf_id: uf.id)
# 	end
# elsif cargo.nome.eql? "Deputado Estadual"
# 	Uf.all.each do |uf|
# 		qtde_vagas = 25 + rand(70) # mínimo 24 e máximo 94
# 		CargoEleicao.create(cargo_id: cargo.id, vagas: qtde_vagas, eleicao_id: eleicao.id, uf_id: uf.id)
# 	end