class ApplicationController < ActionController::Base
  protect_from_forgery

  set_current_tenant :tenant_name

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
  helper_method :tenant_name

  def tenant_name
    current_user.tenant.name rescue '-'
  end

end
