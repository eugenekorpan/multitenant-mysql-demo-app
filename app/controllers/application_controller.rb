class ApplicationController < ActionController::Base
  protect_from_forgery

  include Multitenant::Mysql::ActionController

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :current_user

end
