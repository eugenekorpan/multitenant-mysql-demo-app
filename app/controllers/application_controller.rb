class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_connection 
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :current_user

  private

  def set_connection
    ActiveRecord::Base.establish_connection(
      :adapter  => "mysql2",
      :host     => "localhost",
      :username => current_user.tenant.name,
      :password => "password",
      :database => "tenant_dev"
    )
  end

end
