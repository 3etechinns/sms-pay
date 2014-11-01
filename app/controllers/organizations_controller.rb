class OrganizationController < ApplicationController 
  def new
  end

  def create
    @organization = Organization.new(organization_params)
    
    if @organization.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  private
  
  def organization_params
    params.require(:organization).permit(:email, :password, :password_confirmation, :name, :paypal)
  end