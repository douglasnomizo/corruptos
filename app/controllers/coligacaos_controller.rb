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
    @eleicao = Eleicao.find(:first, :conditions => "status = true")
    
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
    @coligacao = Coligacao.new(params[:coligacao])

    respond_to do |format|
      if @coligacao.save
        format.html { redirect_to @coligacao, notice: 'Coligacao was successfully created.' }
        format.json { render json: @coligacao, status: :created, location: @coligacao }
      else
        format.html { render action: "new" }
        format.json { render json: @coligacao.errors, status: :unprocessable_entity }
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
