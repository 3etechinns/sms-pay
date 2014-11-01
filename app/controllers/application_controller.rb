class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_org
    @current_org ||= Organization.find(session[:organization_id]) if session[:organization_id]
  end

  helper_method :current_org
end
