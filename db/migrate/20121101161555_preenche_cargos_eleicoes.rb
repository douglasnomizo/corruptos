# encoding: utf-8
class PreencheCargosEleicoes < ActiveRecord::Migration
  def up
  	Eleicao.create(:ano => 2012, :status => true)
  	cargos = Cargo.all
		eleicao = Eleicao.find(:first, :conditions => "status = true")
		estados = Uf.find(:all, :conditions => "sigla = 'GO'")

		cargos.each do |cargo|
			if cargo.nome.eql? "Presidente"
				CargoEleicao.create(:cargo_id => cargo.id, :vagas => 1, :eleicao_id => eleicao.id)
			elsif cargo.nome.eql? "Governador"
				estados.each do |estado|
					CargoEleicao.create(:cargo_id => cargo.id, :vagas => 1, :eleicao_id => eleicao.id, :uf_id => estado.id)
				end
			elsif cargo.nome.eql? "Senador"
				estados.each do |estado|
					CargoEleicao.create(:cargo_id => cargo.id, :vagas => 3, :eleicao_id => eleicao.id, :uf_id => estado.id)
				end
			elsif cargo.nome.eql? "Prefeito"
				estados.each do |estado|
					estado.municipios.each do |municipio|
						CargoEleicao.create(:cargo_id => cargo.id, :vagas => 1, :eleicao_id => eleicao.id, :uf_id => estado.id, :municipio_id => municipio.id)
					end
				end
			elsif cargo.nome.eql? "Deputado Federal"
				estados.each do |estado|
					qtde_vagas = 9 + rand(62) # mínimo 8 e máximo 70
					CargoEleicao.create(:cargo_id => cargo.id, :vagas => qtde_vagas, :eleicao_id => eleicao.id, :uf_id => estado.id)	
				end
			elsif cargo.nome.eql? "Deputado Estadual"
				estados.each do |estado|
					qtde_vagas = 25 + rand(70) # mínimo 24 e máximo 94
					CargoEleicao.create(:cargo_id => cargo.id, :vagas => qtde_vagas, :eleicao_id => eleicao.id, :uf_id => estado.id)	
				end	
			elsif cargo.nome.eql? "Vereador"
				estados.each do |estado|
					estado.municipios.each do |municipio|
						qtde_vagas = 10 + rand(46) # mínimo 9 e máximo 55
						CargoEleicao.create(:cargo_id => cargo.id, :vagas => qtde_vagas, :eleicao_id => eleicao.id, :uf_id => estado.id, :municipio_id => municipio.id)	
					end
				end	
			end
		end	
  end

  def down
  	CargoEleicao.delete_all
  end
end
