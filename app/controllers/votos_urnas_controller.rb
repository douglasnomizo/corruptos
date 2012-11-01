class VotosUrnasController < ApplicationController
  # GET /votos_urnas
  # GET /votos_urnas.json
  def index
    @votos_urnas = VotosUrna.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votos_urnas }
    end
  end

  # GET /votos_urnas/1
  # GET /votos_urnas/1.json
  def show
    @votos_urna = VotosUrna.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @votos_urna }
    end
  end

  # GET /votos_urnas/new
  # GET /votos_urnas/new.json
  def new
    @votos_urna = VotosUrna.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @votos_urna }
    end
  end

  # GET /votos_urnas/1/edit
  def edit
    @votos_urna = VotosUrna.find(params[:id])
  end

  # POST /votos_urnas
  # POST /votos_urnas.json
  def create
    @votos_urna = VotosUrna.new(params[:votos_urna])

    respond_to do |format|
      if @votos_urna.save
        format.html { redirect_to @votos_urna, notice: 'Votos urna was successfully created.' }
        format.json { render json: @votos_urna, status: :created, location: @votos_urna }
      else
        format.html { render action: "new" }
        format.json { render json: @votos_urna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votos_urnas/1
  # PUT /votos_urnas/1.json
  def update
    @votos_urna = VotosUrna.find(params[:id])

    respond_to do |format|
      if @votos_urna.update_attributes(params[:votos_urna])
        format.html { redirect_to @votos_urna, notice: 'Votos urna was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @votos_urna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votos_urnas/1
  # DELETE /votos_urnas/1.json
  def destroy
    @votos_urna = VotosUrna.find(params[:id])
    @votos_urna.destroy

    respond_to do |format|
      format.html { redirect_to votos_urnas_url }
      format.json { head :no_content }
    end
  end
end
