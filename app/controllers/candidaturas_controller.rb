class CandidaturasController < ApplicationController
  # GET /candidaturas
  # GET /candidaturas.json
  def index
    @candidaturas = Candidatura.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidaturas }
    end
  end

  # GET /candidaturas/1
  # GET /candidaturas/1.json
  def show
    @candidatura = Candidatura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidatura }
    end
  end

  # GET /candidaturas/new
  # GET /candidaturas/new.json
  def new
    @candidatura = Candidatura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidatura }
    end
  end

  # GET /candidaturas/1/edit
  def edit
    @candidatura = Candidatura.find(params[:id])
  end

  # POST /candidaturas
  # POST /candidaturas.json
  def create
    @candidatura = Candidatura.new(params[:candidatura])

    respond_to do |format|
      if @candidatura.save
        format.html { redirect_to @candidatura, notice: 'Candidatura was successfully created.' }
        format.json { render json: @candidatura, status: :created, location: @candidatura }
      else
        format.html { render action: "new" }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidaturas/1
  # PUT /candidaturas/1.json
  def update
    @candidatura = Candidatura.find(params[:id])

    respond_to do |format|
      if @candidatura.update_attributes(params[:candidatura])
        format.html { redirect_to @candidatura, notice: 'Candidatura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidaturas/1
  # DELETE /candidaturas/1.json
  def destroy
    @candidatura = Candidatura.find(params[:id])
    @candidatura.destroy

    respond_to do |format|
      format.html { redirect_to candidaturas_url }
      format.json { head :no_content }
    end
  end
end
