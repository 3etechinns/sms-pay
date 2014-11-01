class SessionsController < ApplicationController 
  def create
    @organization = Organization.authenticate(params[:email], params[:password])

    if @organization
      flash[:notice] = "You've been logged in."
      session[:organization_id] = @organization.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:organization_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end