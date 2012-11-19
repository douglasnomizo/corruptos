# encoding: utf-8
class CandidatosController < ApplicationController

  def carrega_dados
    @eleitor = Eleitor.find(:first, :joins => :endereco, :conditions => ["cpf = ?", params[:cpf]])
    if @eleitor
      render :json => @eleitor
    else
      render :json => '{"erro":"true"}'
    end
  end

  # GET /candidatos
  # GET /candidatos.json
  def index
    @q = Candidato.search(params[:q])
    @candidatos = @q.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidatos }
    end
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
    @candidato = Candidato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidato }
    end
  end

  # GET /candidatos/new
  # GET /candidatos/new.json
  def new
    @candidato = Candidato.new
    @candidato.build_candidatura
    @candidato.build_eleitor

    respond_to do |format|
      format.html
    end
  end

  # GET /candidatos/1/edit
  def edit
    @candidato = Candidato.find(params[:id])
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    completed = false
    eleitor = Eleitor.find(params[:candidato][:eleitor_id])
    cargo = Cargo.find(params[:candidato][:candidatura_attributes].delete :cargo_eleicao_id)
    cpf = params[:candidato].delete :cpf

    if "Presidente".eql? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id is null and municipio_id is null", eleicao_atual.id, cargo.id])
    elsif ["Governador", "Deputado Federal", "Deputado Estadual", "Senador"].include? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id = ? and municipio_id is null", eleicao_atual.id, cargo.id, eleitor.endereco.municipio.uf.id])
    elsif ["Vereador", "Prefeito"].include? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and municipio_id = ?", eleicao_atual.id, cargo.id, eleitor.endereco.municipio.id])
    end

    params[:candidato][:candidatura_attributes][:cargo_eleicao_id] = @cargo_eleicao.id if @cargo_eleicao
    candidatura_attributes = params[:candidato].delete :candidatura_attributes

    Candidato.transaction do
      @candidato = Candidato.new params[:candidato]
      if @candidato.save
        @candidato.build_candidatura candidatura_attributes
        if @candidato.save
          completed = true
        else
          puts @candidato.candidatura.errors.inspect
          raise ActiveRecord::Rollback
        end
      else
        puts @candidato.errors.inspect
        raise ActiveRecord::Rollback
      end
    end


    if completed
      redirect_to @candidato, notice: 'Candidato criado com sucesso.'
    else
      @candidato.cpf = cpf
      render action: "new"
    end
  end

  # PUT /candidatos/1
  # PUT /candidatos/1.json
  def update
    completed = false
    @candidato = Candidato.find(params[:id])
    cpf = params[:candidato].delete :cpf
    eleitor = Eleitor.find(params[:candidato][:eleitor_id])
    cargo = Cargo.find(params[:candidato][:candidatura_attributes].delete :cargo_eleicao_id)
    params[:candidato].delete :eleitor_attributes

    if "Presidente".eql? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id is null and municipio_id is null", eleicao_atual.id, cargo.id])
    elsif ["Governador", "Deputado Federal", "Deputado Estadual", "Senador"].include? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id = ? and municipio_id is null", eleicao_atual.id, cargo.id, eleitor.endereco.municipio.uf.id])
    elsif ["Vereador", "Prefeito"].include? cargo.nome
      @cargo_eleicao = CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and municipio_id = ?", eleicao_atual.id, cargo.id, eleitor.endereco.municipio.id])
    end

    params[:candidato][:candidatura_attributes][:cargo_eleicao_id] = @cargo_eleicao.id if @cargo_eleicao
    params[:candidato][:candidatura_attributes].delete :candidato_id
    candidatura_attributes = params[:candidato].delete :candidatura_attributes

    Candidato.transaction do
      if @candidato.candidatura.update_attributes candidatura_attributes
        puts params[:candidato]
        if @candidato.update_attributes params[:candidato]
          completed = true
        else
          puts @candidato.errors.inspect
          raise ActiveRecord::Rollback
        end
      else
        puts @candidato.candidatura.errors.inspect
        raise ActiveRecord::Rollback
      end
    end


    if completed
      redirect_to @candidato, notice: 'Candidato atualizado com sucesso!'
    else
      render action: "edit"
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @candidato = Candidato.find(params[:id])
    @candidato.destroy

    respond_to do |format|
      format.html { redirect_to candidatos_url }
      format.json { head :no_content }
    end
  end
end