class SurveysController < ApplicationController
  def new
  end

  def calculate_emissions
    TransportEmissionService.new(params[:transport]).call
    # create instance variable in the create method, that calls the function.
  end
end
