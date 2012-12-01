puts "Gerando Votos"

eleicao = Eleicao.first
cargos_eleicao = CargoEleicao.where(eleicao_id: eleicao.id)

Secao.all.each do |s|
	c = Candidatura.offset(rand(Candidatura.count)).first
	qtd_votos = rand(100)
	VotosUrna.create(secao_id: s.id, candidatura_id: c.id, qtd_votos: qtd_votos)
end

# cargos_eleicao.each do |ce|
# 	candidaturas = Candidatura.where(cargo_eleicao_id: ce.id])
# 	candidaturas.each do |can|
# 		zonas = Zona.where(endereco_id: can.cargo_eleicao.endereco.id)
# 		zonas.each do |z|
# 			z.secaos.each do |s|
# 				qtd_votos = rand(100)
# 				VotosUrna.create(secao_id: s.id, candidatura_id: can.id, qtd_votos: qtd_votos)
# 			end
# 		end
# 	end
# end


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