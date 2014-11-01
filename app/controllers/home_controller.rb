class HomeController < ApplicationController
  def index
    if current_org
      redirect_to organization_charges_path(current_org)
    end
  end
end