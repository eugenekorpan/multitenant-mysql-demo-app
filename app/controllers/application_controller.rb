class ApplicationController < ActionController::Base
  protect_from_forgery

  set_current_tenant :tenant_name

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :current_user

  def tenant_name
    current_user.tenant.name
  end

end
