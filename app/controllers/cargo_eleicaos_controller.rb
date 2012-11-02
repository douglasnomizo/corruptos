class CargoEleicaosController < ApplicationController
  # GET /cargo_eleicaos
  # GET /cargo_eleicaos.json
  def index
    @cargo_eleicaos = CargoEleicao.paginate(:page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cargo_eleicaos }
    end
  end

  # GET /cargo_eleicaos/1
  # GET /cargo_eleicaos/1.json
  def show
    @cargo_eleicao = CargoEleicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cargo_eleicao }
    end
  end

  # GET /cargo_eleicaos/new
  # GET /cargo_eleicaos/new.json
  def new
    @uf = Uf.first
    @municipios = @uf.municipios
    @cargo_eleicao = Eleicao.find(:first, :conditions => "status = true").cargo_eleicaos

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cargo_eleicao }
    end
  end

  # GET /cargo_eleicaos/1/edit
  def edit
    @cargo_eleicao = CargoEleicao.find(params[:id])
  end

  # POST /cargo_eleicaos
  # POST /cargo_eleicaos.json
  def create
    @cargo_eleicao = CargoEleicao.new(params[:cargo_eleicao])

    respond_to do |format|
      if @cargo_eleicao.save
        format.html { redirect_to @cargo_eleicao, notice: 'Cargo eleicao was successfully created.' }
        format.json { render json: @cargo_eleicao, status: :created, location: @cargo_eleicao }
      else
        format.html { render action: "new" }
        format.json { render json: @cargo_eleicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cargo_eleicaos/1
  # PUT /cargo_eleicaos/1.json
  def update
    @cargo_eleicao = CargoEleicao.find(params[:id])

    respond_to do |format|
      if @cargo_eleicao.update_attributes(params[:cargo_eleicao])
        format.html { redirect_to @cargo_eleicao, notice: 'Cargo eleicao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cargo_eleicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargo_eleicaos/1
  # DELETE /cargo_eleicaos/1.json
  def destroy
    @cargo_eleicao = CargoEleicao.find(params[:id])
    @cargo_eleicao.destroy

    respond_to do |format|
      format.html { redirect_to cargo_eleicaos_url }
      format.json { head :no_content }
    end
  end
end
