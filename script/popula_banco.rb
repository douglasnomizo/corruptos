
puts "Gerando Eleitores e Titulos"

n = 1
while n < 10000
	nome = "Eleitor " + n.to_s
	mae = "Mamae " + n.to_s
	cpf = 10_000_000_000 + rand(100_000_000_000)
	nascimento = rand(Date.new(1930)..Date.new(1995))
	rg = 10_000 + rand(100_000_000)

	e = Eleitor.new(nome: nome, nome_mae: mae, rg: rg, data_nascimento: nascimento, cpf: cpf.to_s, endereco_id: 2)
	s = Secao.offset(rand(Secao.count)).first

	juiz = "Juiz " + (1+rand(100)).to_s
	emissao = rand(Date.new(1995)..Date.new(2011))
	cod = 100_000_000_000 + rand(1_000_000_000_000)

	Eleitor.transaction do
		if e.save
			t = Titulo.new(data_emissao: emissao, juiz_eleitoral: juiz, status: true, eleitor_id: e.id, secao_id: s.id, codigo: cod)
			if t.save
			else
				ActiveRecord::Rollback
			end
		end
	end
	n += 1
end

puts "Gerando Candidatos"

eleitores = Eleitor.all
eleitores.each_with_index do |e, idx|
	break if idx >= 200

	nome_c = "Super " + e.nome	
	c = Candidato.new(nome_campanha: nome_c, eleitor_id: e.id)

	Candidato.transaction do
		if c.save
			ce = CargoEleicao.offset(rand(CargoEleicao.count)).first
			par = Partido.offset(rand(Partido.count)).first
			cod_can = 10_000 + rand(10_000_000)

			can = Candidatura.new(candidato_id: c.id, cargo_eleicao_id: ce.id, partido_id: par, codigo_candidato: cod_can)
			if can.save
			else
				ActiveRecord::Rollback
			end
		end
	end
end

puts "Gerando Votos"

secoes = Secao.all
cargos = Cargo.all

cargos.each do |cargo|
	cargos_eleicao = CargoEleicao.where(cargo_id: cargo.id)
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
end



