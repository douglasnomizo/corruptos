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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidato }
    end
  end

  # GET /candidatos/1/edit
  def edit
    @candidato = Candidato.find(params[:id])
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    debugger
    respond_to do |format|
      ActiveRecord::Base.transaction do
        @candidato = Candidato.new
        @candidato.eleitor_id = params[:candidato][:eleitor][:id]
        @candidato.nome_campanha = params[:candidato][:nome_campanha]
        if @candidato.save
          @candidatura = Candidatura.new
          @candidatura.cargo_eleicao_id = cargo_eleicao.id
          @candidatura.partido_id = params[:candidato][:candidatura][:partido_id]
          @candidatura.codigo_candidato = params[:candidato][:candidatura][:codigo_candidato]
          @candidatura.candidato_id = @candidato.id

          if @candidatura.save
            format.html { redirect_to @candidato, notice: 'Candidato criado com sucesso.' }
          else
            puts @candidatura.errors.inspect
            raise ActiveRecord::Rollback
            format.html { render action: "new", notice: "Erro!" }          
          end
        else
            puts @candidato.errors.inspect
            raise ActiveRecord::Rollback
            format.html { render action: "new", notice: "Erro!" }
        end
      end
    end
  end

  # PUT /candidatos/1
  # PUT /candidatos/1.json
  def update
    @candidato = Candidato.find(params[:id])

    respond_to do |format|
      if @candidato.update_attributes(params[:candidato])
        format.html { redirect_to @candidato, notice: 'Candidato atualizado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
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
