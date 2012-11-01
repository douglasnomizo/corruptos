require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TitulosController do

  # This should return the minimal set of attributes required to create a valid
  # Titulo. As you add validations to Titulo, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TitulosController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all titulos as @titulos" do
      titulo = Titulo.create! valid_attributes
      get :index, {}, valid_session
      assigns(:titulos).should eq([titulo])
    end
  end

  describe "GET show" do
    it "assigns the requested titulo as @titulo" do
      titulo = Titulo.create! valid_attributes
      get :show, {:id => titulo.to_param}, valid_session
      assigns(:titulo).should eq(titulo)
    end
  end

  describe "GET new" do
    it "assigns a new titulo as @titulo" do
      get :new, {}, valid_session
      assigns(:titulo).should be_a_new(Titulo)
    end
  end

  describe "GET edit" do
    it "assigns the requested titulo as @titulo" do
      titulo = Titulo.create! valid_attributes
      get :edit, {:id => titulo.to_param}, valid_session
      assigns(:titulo).should eq(titulo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Titulo" do
        expect {
          post :create, {:titulo => valid_attributes}, valid_session
        }.to change(Titulo, :count).by(1)
      end

      it "assigns a newly created titulo as @titulo" do
        post :create, {:titulo => valid_attributes}, valid_session
        assigns(:titulo).should be_a(Titulo)
        assigns(:titulo).should be_persisted
      end

      it "redirects to the created titulo" do
        post :create, {:titulo => valid_attributes}, valid_session
        response.should redirect_to(Titulo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved titulo as @titulo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Titulo.any_instance.stub(:save).and_return(false)
        post :create, {:titulo => {}}, valid_session
        assigns(:titulo).should be_a_new(Titulo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Titulo.any_instance.stub(:save).and_return(false)
        post :create, {:titulo => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested titulo" do
        titulo = Titulo.create! valid_attributes
        # Assuming there are no other titulos in the database, this
        # specifies that the Titulo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Titulo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => titulo.to_param, :titulo => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested titulo as @titulo" do
        titulo = Titulo.create! valid_attributes
        put :update, {:id => titulo.to_param, :titulo => valid_attributes}, valid_session
        assigns(:titulo).should eq(titulo)
      end

      it "redirects to the titulo" do
        titulo = Titulo.create! valid_attributes
        put :update, {:id => titulo.to_param, :titulo => valid_attributes}, valid_session
        response.should redirect_to(titulo)
      end
    end

    describe "with invalid params" do
      it "assigns the titulo as @titulo" do
        titulo = Titulo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Titulo.any_instance.stub(:save).and_return(false)
        put :update, {:id => titulo.to_param, :titulo => {}}, valid_session
        assigns(:titulo).should eq(titulo)
      end

      it "re-renders the 'edit' template" do
        titulo = Titulo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Titulo.any_instance.stub(:save).and_return(false)
        put :update, {:id => titulo.to_param, :titulo => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested titulo" do
      titulo = Titulo.create! valid_attributes
      expect {
        delete :destroy, {:id => titulo.to_param}, valid_session
      }.to change(Titulo, :count).by(-1)
    end

    it "redirects to the titulos list" do
      titulo = Titulo.create! valid_attributes
      delete :destroy, {:id => titulo.to_param}, valid_session
      response.should redirect_to(titulos_url)
    end
  end

end