# encoding: utf-8
class ColigacaosController < ApplicationController

  # GET /coligacaos
  # GET /coligacaos.json
  def index
    @coligacoes = Coligacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coligacaos }
    end
  end

  # GET /coligacaos/1
  # GET /coligacaos/1.json
  def show
    @coligacao = Coligacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coligacao }
    end
  end

  # GET /coligacaos/new
  # GET /coligacaos/new.json
  def new
    @coligacao = Coligacao.new    
    @coligacao.cargo_eleicao = CargoEleicao.first

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coligacao }
    end
  end

  # GET /coligacaos/1/edit
  def edit
    @coligacao = Coligacao.find(params[:id])
  end

  # POST /coligacaos
  # POST /coligacaos.json
  def create
    Coligacao.transaction do
      coligacao_partido = params[:coligacao].delete :coligacao_partido
      cargo_eleicao = params[:coligacao].delete :cargo_eleicao
      puts cargo_eleicao.inspect

      if cargo_eleicao[:municipio_id]
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and municipio_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:municipio_id]])
      elsif cargo_eleicao[:uf_id]
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:uf_id]])        
      else
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id]]) unless @cargo_eleicao  
      end
      
      @coligacao = Coligacao.new(params[:coligacao])
      puts @coligacao.partidos.size

      if @cargo_eleicao
        @coligacao.cargo_eleicao = @cargo_eleicao
      end

      if @coligacao.save
        redirect_to @coligacao, notice: 'Coligacao criada com sucesso!'
      else
        ActiveRecord::Rollback
        render action: "new"    
      end
    end
  end

  # PUT /coligacaos/1
  # PUT /coligacaos/1.json
  def update
    @coligacao = Coligacao.find(params[:id])

    respond_to do |format|
      if @coligacao.update_attributes(params[:coligacao])
        format.html { redirect_to @coligacao, notice: 'Coligacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coligacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coligacaos/1
  # DELETE /coligacaos/1.json
  def destroy
    @coligacao = Coligacao.find(params[:id])
    @coligacao.destroy

    respond_to do |format|
      format.html { redirect_to coligacaos_url }
      format.json { head :no_content }
    end
  end
end
