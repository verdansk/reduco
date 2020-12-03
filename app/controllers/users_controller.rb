class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_animal]

  def show
    @challenges = UserChallenge.where(user_id: @user.id)
    @animal = show_animal
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end

  def search
    @query = params[:search].downcase
    @search_users = User.search_by_first_last_name_email(@query)
    @user = current_user
    render :show
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def show_animal
    if @user.daily_emission.to_i < 12_000
      'bird'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'owl'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'penguin'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'fox'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'lion'
    else
      'bear'
    end
  end

  def set_user
    @user = current_user
  end
end
