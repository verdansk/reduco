class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_animal]

  def show
    @users = User.all
    @user = current_user
    @query = "Search a friend.."

    @challenges = UserChallenge.where(user_id: @user.id)

    @animal = show_animal
    @animal_name = show_animal_name
    @animal_level = show_animal_level
    @animal_next_level = show_animal_next_level
    @animal_next_level_pic = show_animal_next_level_pic

    @animal_back_level = show_animal_back_level
    @animal_back_level_pic = show_animal_back_level_pic

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
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 12_000
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

  def show_animal_name
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

  def show_animal_level
    if @user.daily_emission.to_i < 12_000
      'Level 6'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'Level 5'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'Level 4'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'Level 3'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'Level 2'
    elsif @user.daily_emission.to_i > 16_800
      'Level 1'
    else
      'Level 7'
    end
  end


 def show_animal_next_level

    if @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'Level 6'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'Level 5'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'Level 4'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'Level 3'
    elsif @user.daily_emission.to_i > 16_800
      'Level 2'
    else
      'Top!'
    end
end

def show_animal_next_level_pic
    if @user.daily_emission.to_i < 12_000
      'hill.svg'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'bird.svg'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'owl.svg'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'penguin.svg'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'fox.svg'
    else
      'lion.svg'
    end
end

def show_animal_back_level
    if @user.daily_emission.to_i < 12_000
      'Level 5'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'Level 4'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'Level 3'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'Level 2'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'Level 1'
    end
end

def show_animal_back_level_pic
    if @user.daily_emission.to_i < 12_000
      'owl.svg'
    elsif @user.daily_emission.to_i > 12_000 && @user.daily_emission.to_i <= 13_200
      'penguin.svg'
    elsif @user.daily_emission.to_i > 13_300 && @user.daily_emission.to_i <= 14_400
      'fox.svg'
    elsif @user.daily_emission.to_i > 14_400 && @user.daily_emission.to_i <= 15_600
      'lion.svg'
    elsif @user.daily_emission.to_i > 15_600 && @user.daily_emission.to_i <= 16_800
      'bear.svg'
    end
end


  def set_user
    @user = current_user
  end
end
