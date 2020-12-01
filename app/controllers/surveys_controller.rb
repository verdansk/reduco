class SurveysController < ApplicationController
  def new
    @user = current_user
    @users = User.all
    @transport = Transport.new
  end

  def create
    raise
  end

  def calculate_emissions
    TransportEmissionService.new(params[:transport]).call
    # create instance variable in the create method, that calls the function.
  end
end
