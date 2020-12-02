class SurveysController < ApplicationController
  before_action :set_user, only: [:create, :new]

  def new
    @users = User.all
    @transport = Transport.new
  end

  def create
    create_transports
    # create_housing etc..
  end

  private

  # Method to create a new datarow in Transport-table
  def create_transports
    @transport = Transport.new(strong_params_transports)
    @transport.value = calculate_emissions
    @transport.user = @user
    if @transport.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def calculate_emissions
    TransportEmissionService.new(params[:category]).call
  end

  def strong_params_transports
    params.permit(:category)
  end

  def set_user
    @user = current_user
  end
end
