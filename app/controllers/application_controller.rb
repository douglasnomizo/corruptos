class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_cache_buster

  def eleicao_atual
    Eleicao.find(:first, :conditions => "status = true")
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
