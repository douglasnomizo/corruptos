class EleitorsController < ApplicationController
  
  # GET /eleitors
  # GET /eleitors.json
  def index
    @q = Eleitor.search(params[:q])
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
    @endereco = Endereco.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eleitor }
    end
  end

  # GET /eleitors/1/edit
  def edit
    @eleitor = Eleitor.find(params[:id])
    @endereco = @eleitor.endereco
  end

  # POST /eleitors
  # POST /eleitors.json
  def create
    completed = false
    params[:eleitor][:endereco].delete :municipio
    params[:eleitor][:titulo_attributes].delete :secao

    Eleitor.transaction do
      @endereco = Endereco.new(params[:eleitor][:endereco])
      params[:eleitor].delete :endereco      
      titulo_attributes = params[:eleitor].delete :titulo_attributes
      if @endereco.save        
        @eleitor = Eleitor.new(params[:eleitor])
        @eleitor.endereco_id = @endereco.id

        if @eleitor.save
          @eleitor.build_titulo titulo_attributes
          if @eleitor.save
            completed = true
          end
        end
      end

      if completed
        redirect_to @eleitor, notice: 'Eleitor criado com sucesso!'
      else
        titulo_errors = @eleitor.titulo.errors if @eleitor.titulo
        @eleitor.build_titulo titulo_attributes        
        if titulo_errors
          titulo_errors.messages.each do |k,v|
            @eleitor.titulo.errors.add(k, v.first)
          end
        end
        render action: "new"
        raise ActiveRecord::Rollback
      end  
    end

    
  end

  # PUT /eleitors/1
  # PUT /eleitors/1.json
  def update
    completed = false
    params[:eleitor][:endereco].delete :municipio
    params[:eleitor][:titulo_attributes].delete :secao

    Eleitor.transaction do
      @eleitor = Eleitor.find(params[:id])
      
      if @eleitor.endereco.update_attributes(params[:eleitor][:endereco])
        params[:eleitor].delete :endereco              
        titulo = params[:eleitor].delete :titulo_attributes
        if @eleitor.build_titulo titulo
          if @eleitor.save
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
