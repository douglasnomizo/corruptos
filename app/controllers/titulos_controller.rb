class TitulosController < ApplicationController
  # GET /titulos
  # GET /titulos.json
  def index
    @titulos = Titulo.find(:all, conditions: "status is true")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @titulos }
    end
  end

  # GET /titulos/1
  # GET /titulos/1.json
  def show
    @titulo = Titulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @titulo }
    end
  end

  # GET /titulos/new
  # GET /titulos/new.json
  def new
    @titulo = Titulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @titulo }
    end
  end

  # GET /titulos/1/edit
  def edit
    @titulo = Titulo.find(params[:id])
  end

  # POST /titulos
  # POST /titulos.json
  def create
    @titulo = Titulo.new(params[:titulo])

    respond_to do |format|
      if @titulo.save
        format.html { redirect_to @titulo, notice: 'Titulo was successfully created.' }
        format.json { render json: @titulo, status: :created, location: @titulo }
      else
        format.html { render action: "new" }
        format.json { render json: @titulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /titulos/1
  # PUT /titulos/1.json
  def update
    @titulo = Titulo.find(params[:id])

    respond_to do |format|
      if @titulo.update_attributes(params[:titulo])
        format.html { redirect_to @titulo, notice: 'Titulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @titulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titulos/1
  # DELETE /titulos/1.json
  def destroy
    @titulo = Titulo.find(params[:id])
    @titulo.destroy

    respond_to do |format|
      format.html { redirect_to titulos_url }
      format.json { head :no_content }
    end
  end
end
