class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_org
    @current_org ||= Organization.find(session[:organization_id]) if session[:organization_id]
  end

  def client
    account_sid = 'ACbb49022bd031a99d9967595de4d4216a'
    auth_token = '5be587638d9fa909c1ab0f116974dc65'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  helper_method :current_org
end
