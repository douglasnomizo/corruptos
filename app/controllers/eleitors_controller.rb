class EleitorsController < ApplicationController

  # GET /eleitors
  # GET /eleitors.json
  def index
    @q = Eleitor.paginate(page: params[:page]).search(params[:q])
    @eleitors = @q.result(:distinct => true)

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
    @eleitor.build_titulo
    @eleitor.build_endereco
  end

  # GET /eleitors/1/edit
  def edit
    @eleitor = Eleitor.find(params[:id])
  end

  # POST /eleitors
  # POST /eleitors.json
  def create
    completed = false
    params[:eleitor][:endereco_attributes].delete :municipio
    params[:eleitor][:titulo_attributes].delete :secao
    titulo_attributes = params[:eleitor].delete :titulo_attributes
    endereco_attributes = params[:eleitor][:endereco_attributes]
    Eleitor.transaction do
      @endereco = Endereco.new endereco_attributes
      params[:eleitor].delete :endereco

      if @endereco.save
        @eleitor = Eleitor.new params[:eleitor]
        @eleitor.endereco_id = @endereco.id

        if @eleitor.save
          @eleitor.build_titulo titulo_attributes
          if @eleitor.save
            completed = true
          else
            raise ActiveRecord::Rollback
          end
        end
      else
        @eleitor = Eleitor.new params[:eleitor]
        @eleitor.build_endereco endereco_attributes
      end
    end

    if completed
      redirect_to @eleitor, notice: 'Eleitor criado com sucesso!'
    else
      titulo_errors = @eleitor.titulo.errors if @eleitor.titulo
      endereco_errors = @endereco.errors
      eleitor_errors = @eleitor.errors

      @eleitor = Eleitor.new(params[:eleitor])

      if titulo_errors
        @eleitor.build_titulo titulo_attributes
        if titulo_errors
          titulo_errors.messages.each do |k,v|
            @eleitor.titulo.errors.add(k, v.first)
          end
        end
      else
        @eleitor.build_titulo
      end

      if endereco_errors
        @eleitor.build_endereco endereco_attributes
        if endereco_errors
          endereco_errors.messages.each do |k,v|
            @eleitor.endereco.errors.add(k, v.first)
          end
        end
      else
        @eleitor.build_endereco
      end

      if eleitor_errors
        eleitor_errors.messages.each do |k,v|
          @eleitor.errors.add(k, v.first)
        end
      end

      render action: "new"
    end

  end

  # PUT /eleitors/1
  # PUT /eleitors/1.json
  def update
    completed = false
    params[:eleitor][:endereco_attributes].delete :municipio
    params[:eleitor][:titulo_attributes].delete :secao
    @eleitor = Eleitor.find(params[:id])

    Eleitor.transaction do
      if @eleitor.endereco.update_attributes(params[:eleitor][:endereco_attributes])
        params[:eleitor].delete :endereco_attributes
        titulo = params[:eleitor].delete :titulo_attributes
        if @eleitor.build_titulo titulo
          if @eleitor.update_attributes params[:eleitor]
            completed = true
          end
        end
      end

      if completed
        redirect_to @eleitor, notice: 'Eleitor atualizado com sucesso!'
      else
        @endereco = @eleitor.endereco
        titulo_errors = @eleitor.titulo.errors if @eleitor.titulo
        if titulo_errors
          titulo_errors.messages.each do |k,v|
            @eleitor.titulo.errors.add(k, v.first)
          end
        end
        render action: "edit"
        raise ActiveRecord::Rollback
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
