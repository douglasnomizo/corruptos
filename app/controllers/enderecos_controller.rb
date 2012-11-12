# encoding: utf-8
class EnderecosController < ApplicationController
  
  def busca_cep
    require 'net/http'
    require 'cgi'

    url = URI.parse("http://cep.republicavirtual.com.br/web_cep.php?cep=#{params[:cep]}&formato=query_string")
    consulta = Net::HTTP.get_response(url)
    pesquisa = CGI::parse(consulta.body)
    pesquisa = Hash[*pesquisa.map { |k, v| [k, v[0]] }.flatten]
    
    pesquisa['bairro'] = pesquisa['bairro'].force_encoding("ISO-8859-1").encode("UTF-8")
    pesquisa['cidade'] = pesquisa['cidade'].force_encoding("ISO-8859-1").encode("UTF-8")
    pesquisa['resultado_txt'] = pesquisa['resultado_txt'].force_encoding("ISO-8859-1").encode("UTF-8")

    @cidade = Municipio.find(:first, :conditions => ["nome = ?", pesquisa['cidade']])
    @uf = Uf.find(:first, :conditions => ["sigla = ?", pesquisa['uf']])

    pesquisa['cidade'] = @cidade.id.to_s if @cidade
    pesquisa['uf'] = @uf.id.to_s if @uf

    if pesquisa['resultado'] == "1" or pesquisa['resultado'] == "2"
      render :json => pesquisa
    else
      render :json => '{"erro":"true"}'
    end
  end

  # GET /enderecos
  # GET /enderecos.json
  def index
    @enderecos = Endereco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enderecos }
    end
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @endereco }
    end
  end

  # GET /enderecos/new
  # GET /enderecos/new.json
  def new
    @endereco = Endereco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @endereco }
    end
  end

  # GET /enderecos/1/edit
  def edit
    @endereco = Endereco.find(params[:id])
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(params[:endereco])

    respond_to do |format|
      if @endereco.save
        format.html { redirect_to @endereco, notice: 'Endereco was successfully created.' }
        format.json { render json: @endereco, status: :created, location: @endereco }
      else
        format.html { render action: "new" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enderecos/1
  # PUT /enderecos/1.json
  def update
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      if @endereco.update_attributes(params[:endereco])
        format.html { redirect_to @endereco, notice: 'Endereco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco = Endereco.find(params[:id])
    @endereco.destroy

    respond_to do |format|
      format.html { redirect_to enderecos_url }
      format.json { head :no_content }
    end
  end
end
