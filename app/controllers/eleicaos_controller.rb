class EleicaosController < ApplicationController
  # GET /eleicaos
  # GET /eleicaos.json
  def index
    @eleicaos = Eleicao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eleicaos }
    end
  end

  # GET /eleicaos/1
  # GET /eleicaos/1.json
  def show
    @eleicao = Eleicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eleicao }
    end
  end

  # GET /eleicaos/new
  # GET /eleicaos/new.json
  def new
    @eleicao = Eleicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eleicao }
    end
  end

  # GET /eleicaos/1/edit
  def edit
    @eleicao = Eleicao.find(params[:id])
  end

  # POST /eleicaos
  # POST /eleicaos.json
  def create
    @eleicao = Eleicao.new(params[:eleicao])

    respond_to do |format|
      if @eleicao.save
        format.html { redirect_to @eleicao, notice: 'Eleicao was successfully created.' }
        format.json { render json: @eleicao, status: :created, location: @eleicao }
      else
        format.html { render action: "new" }
        format.json { render json: @eleicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eleicaos/1
  # PUT /eleicaos/1.json
  def update
    @eleicao = Eleicao.find(params[:id])

    respond_to do |format|
      if @eleicao.update_attributes(params[:eleicao])
        format.html { redirect_to @eleicao, notice: 'Eleicao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eleicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eleicaos/1
  # DELETE /eleicaos/1.json
  def destroy
    @eleicao = Eleicao.find(params[:id])
    @eleicao.destroy

    respond_to do |format|
      format.html { redirect_to eleicaos_url }
      format.json { head :no_content }
    end
  end
end
