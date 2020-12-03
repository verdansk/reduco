class UsersController < ApplicationController
  def show
    # dashboard
    @user = current_user
    @animal = show_animal
    # @recent_challenges = User_challenges.order(created_at: :desc).take(4)
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end

  def show_animal
    @user = current_user
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

  def search
    @query = params[:search].downcase
    @search_users = User.search_by_first_last_name_email(@query)

    # @query = params[:search].downcase
    @user = current_user
    # @search_users = User.where("lower(first_name) like ?", "%#{@query }%")
    render :show
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end
end
