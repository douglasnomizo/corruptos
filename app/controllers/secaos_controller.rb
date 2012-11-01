class SecaosController < ApplicationController
  # GET /secaos
  # GET /secaos.json
  def index
    @secaos = Secao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @secaos }
    end
  end

  # GET /secaos/1
  # GET /secaos/1.json
  def show
    @secao = Secao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @secao }
    end
  end

  # GET /secaos/new
  # GET /secaos/new.json
  def new
    @secao = Secao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @secao }
    end
  end

  # GET /secaos/1/edit
  def edit
    @secao = Secao.find(params[:id])
  end

  # POST /secaos
  # POST /secaos.json
  def create
    @secao = Secao.new(params[:secao])

    respond_to do |format|
      if @secao.save
        format.html { redirect_to @secao, notice: 'Secao was successfully created.' }
        format.json { render json: @secao, status: :created, location: @secao }
      else
        format.html { render action: "new" }
        format.json { render json: @secao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /secaos/1
  # PUT /secaos/1.json
  def update
    @secao = Secao.find(params[:id])

    respond_to do |format|
      if @secao.update_attributes(params[:secao])
        format.html { redirect_to @secao, notice: 'Secao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @secao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secaos/1
  # DELETE /secaos/1.json
  def destroy
    @secao = Secao.find(params[:id])
    @secao.destroy

    respond_to do |format|
      format.html { redirect_to secaos_url }
      format.json { head :no_content }
    end
  end
end
