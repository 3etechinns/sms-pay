class ChargesController < ApplicationController
  def index
    @charges = Charge.where(organization: current_org)
  end
end