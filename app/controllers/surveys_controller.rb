class SurveysController < ApplicationController
  before_action :set_user, only: [:create, :new, :update_user_emission]

  def new
    @users = User.all
    @transport = Transport.new
  end

  def create
    create_foods
    create_transports
    create_housings
    update_user_emission
    redirect_to user_path(@user)
  end

  def update_user_emission
    @emission = calculate_emission_sum
    @user.update(daily_emission: @emission)
    @user.save
  end

  private

  def calculate_emission_sum
    EmissionCalculationService.new(@transport.value, @housing.value, @food.value).call
  end

  # Method to create a new datarow in Transport-table
  def create_transports
    @transport = Transport.new(strong_params_transports)
    @transport.value = calculate_transport_emissions
    @transport.user = @user
    @transport.save
  end

  def calculate_transport_emissions
    TransportEmissionService.new(params[:category]).call
  end

  def strong_params_transports
    params.permit(:category)
  end

  # Method to create a new datarow in Food-table
  def create_foods
    @food = Food.new(strong_params_foods)
    @food.value = calculate_emissions
    @food.user = @user
    @food.save
  end

  def calculate_emissions
    FoodEmissionService.new(params[:spend]).call
  end

  def strong_params_foods
    params.permit(:spend)
  end

   # Method to create a new datarow in Housing-table
  def create_housings
    @housing = Housing.new(strong_params_housing)
    @housing.value = calculate_housing_emissions
    @housing.user = @user
    @housing.save
  end

  def calculate_housing_emissions
    HousingEmissionService.new(params[:housing_category]).call
  end

  def strong_params_housing
    params.permit(:housing_category)
  end

  def set_user
    @user = current_user
  end
end
