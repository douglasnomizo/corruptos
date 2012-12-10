# encoding: utf-8
class ColigacaosController < ApplicationController

  # GET /coligacaos
  # GET /coligacaos.json
  def index
    @q = Coligacao.search(params[:q])
    @coligacoes = @q.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /coligacaos/1
  # GET /coligacaos/1.json
  def show
    @coligacao = Coligacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /coligacaos/new
  # GET /coligacaos/new.json
  def new
    @coligacao = Coligacao.new
    @coligacao.cargo_eleicao = CargoEleicao.first

    respond_to do |format|
      format.html # new.html.erb
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

      if cargo_eleicao[:municipio_id]
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and municipio_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:municipio_id]])
      elsif cargo_eleicao[:uf_id]
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:uf_id]])
      else
        @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id]]) unless @cargo_eleicao
      end

      @coligacao = Coligacao.new(params[:coligacao])

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
    coligacao_partido = params[:coligacao].delete :coligacao_partido
    cargo_eleicao = params[:coligacao].delete :cargo_eleicao

    if cargo_eleicao[:municipio_id]
      @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and municipio_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:municipio_id]])
    elsif cargo_eleicao[:uf_id]
      @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ? and uf_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id], cargo_eleicao[:uf_id]])
    else
      @cargo_eleicao =  CargoEleicao.find(:first, conditions: ["eleicao_id = ? and cargo_id = ?", cargo_eleicao[:eleicao_id], cargo_eleicao[:cargo_id]]) unless @cargo_eleicao
    end

    @coligacao = Coligacao.find(params[:id])
    @coligacao.cargo_eleicao = nil

    if @cargo_eleicao
      @coligacao.cargo_eleicao = @cargo_eleicao
    end

    Coligacao.transaction do
      if @coligacao.update_attributes(params[:coligacao])
        redirect_to @coligacao, notice: 'Coligção atualizada com sucesso!'
      else
        ActiveRecord::Rollback
        render action: "edit"
      end
    end
  end

  # DELETE /coligacaos/1
  # DELETE /coligacaos/1.json
  def destroy
    @coligacao = Coligacao.find(params[:id])
    @coligacao.destroy

    redirect_to coligacaos_url
  end
end
