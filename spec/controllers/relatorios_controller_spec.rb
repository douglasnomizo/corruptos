require 'spec_helper'

describe RelatoriosController do

  describe "GET 'candidato'" do
    it "returns http success" do
      get 'candidato'
      response.should be_success
    end
  end

  describe "GET 'zona_secao'" do
    it "returns http success" do
      get 'zona_secao'
      response.should be_success
    end
  end

  describe "GET 'uf_municipio'" do
    it "returns http success" do
      get 'uf_municipio'
      response.should be_success
    end
  end

end
