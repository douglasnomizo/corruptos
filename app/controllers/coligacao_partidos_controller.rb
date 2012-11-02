class ColigacaoPartidosController < ApplicationController
  # GET /coligacao_partidos
  # GET /coligacao_partidos.json
  def index
    @coligacao_partidos = ColigacaoPartido.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coligacao_partidos }
    end
  end

  # GET /coligacao_partidos/1
  # GET /coligacao_partidos/1.json
  def show
    @coligacao_partido = ColigacaoPartido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coligacao_partido }
    end
  end

  # GET /coligacao_partidos/new
  # GET /coligacao_partidos/new.json
  def new
    @coligacao_partido = ColigacaoPartido.new
    @partidos = Partido.find(:all, :order => "nome")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coligacao_partido }
    end
  end

  # GET /coligacao_partidos/1/edit
  def edit
    @coligacao_partido = ColigacaoPartido.find(params[:id])
  end

  # POST /coligacao_partidos
  # POST /coligacao_partidos.json
  def create
    @coligacao_partido = ColigacaoPartido.new(params[:coligacao_partido])

    respond_to do |format|
      if @coligacao_partido.save
        format.html { redirect_to @coligacao_partido, notice: 'Coligacao partido was successfully created.' }
        format.json { render json: @coligacao_partido, status: :created, location: @coligacao_partido }
      else
        format.html { render action: "new" }
        format.json { render json: @coligacao_partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coligacao_partidos/1
  # PUT /coligacao_partidos/1.json
  def update
    @coligacao_partido = ColigacaoPartido.find(params[:id])

    respond_to do |format|
      if @coligacao_partido.update_attributes(params[:coligacao_partido])
        format.html { redirect_to @coligacao_partido, notice: 'Coligacao partido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coligacao_partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coligacao_partidos/1
  # DELETE /coligacao_partidos/1.json
  def destroy
    @coligacao_partido = ColigacaoPartido.find(params[:id])
    @coligacao_partido.destroy

    respond_to do |format|
      format.html { redirect_to coligacao_partidos_url }
      format.json { head :no_content }
    end
  end
end
