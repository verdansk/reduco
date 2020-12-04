class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_animal]

  def show
    @users = User.all
    @user = current_user
    @query = "Search a friend.."
    @challenges = UserChallenge.where(user_id: @user.id)
    @animal = show_animal
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def show_animal
    if @user.daily_emission.to_i < 12_000
      'bird.svg'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'owl.svg'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'penguin.svg'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'fox.svg'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'lion.svg'
    else
      'bear.svg'
    end
  end

  def set_user
    @user = current_user
  end
end
