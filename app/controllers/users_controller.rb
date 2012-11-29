# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    #authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "Usuário Atualizado."
    else
      redirect_zto users_path, :alert => "Não conseguiu atualizar usuário."
    end
  end

  def destroy
    #authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Usuário excluido."
    else
      redirect_to users_path, :notice => "Não pode excluir seu próprio usuário."
    end
  end
end