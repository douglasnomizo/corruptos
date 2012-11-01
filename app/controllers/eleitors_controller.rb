class EleitorsController < ApplicationController
  # GET /eleitors
  # GET /eleitors.json
  def index
    @eleitors = Eleitor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eleitors }
    end
  end

  # GET /eleitors/1
  # GET /eleitors/1.json
  def show
    @eleitor = Eleitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eleitor }
    end
  end

  # GET /eleitors/new
  # GET /eleitors/new.json
  def new
    @eleitor = Eleitor.new
    @titulo = Titulo.new
    @endereco = Endereco.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eleitor }
    end
  end

  # GET /eleitors/1/edit
  def edit
    @eleitor = Eleitor.find(params[:id])
  end

  # POST /eleitors
  # POST /eleitors.json
  def create
    @eleitor = Eleitor.new(params[:eleitor])

    respond_to do |format|
      if @eleitor.save
        format.html { redirect_to @eleitor, notice: 'Eleitor was successfully created.' }
        format.json { render json: @eleitor, status: :created, location: @eleitor }
      else
        format.html { render action: "new" }
        format.json { render json: @eleitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eleitors/1
  # PUT /eleitors/1.json
  def update
    @eleitor = Eleitor.find(params[:id])

    respond_to do |format|
      if @eleitor.update_attributes(params[:eleitor])
        format.html { redirect_to @eleitor, notice: 'Eleitor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eleitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eleitors/1
  # DELETE /eleitors/1.json
  def destroy
    @eleitor = Eleitor.find(params[:id])
    @eleitor.destroy

    respond_to do |format|
      format.html { redirect_to eleitors_url }
      format.json { head :no_content }
    end
  end
end
