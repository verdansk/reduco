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
    @difference = filterFriends
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
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'bird.svg'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'owl.svg'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'penguin.svg'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'fox.svg'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'lion.svg'
    elsif @user.daily_emission.to_i > 19_300 && @user.daily_emission.to_i <= 22_000
      'bear.svg'
    else
      'cow.svg'
    end
  end

  def show_animal_name
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'bird'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'owl'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'penguin'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'fox'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'lion'
    elsif @user.daily_emission.to_i > 19_300 && @user.daily_emission.to_i <= 22_000
      'bear'
    else
      'cow'
    end
  end

  def show_animal_level
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'Level 6'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'Level 5'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'Level 4'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'Level 3'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'Level 2'
    elsif @user.daily_emission.to_i > 19_300 && @user.daily_emission.to_i <= 22_000
      'Level 1'
    else
      'Level 0'
    end
  end


 def show_animal_next_level
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'Level 7'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'Level 6'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'Level 5'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'Level 4'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'Level 3'
    elsif @user.daily_emission.to_i > 19_300 && @user.daily_emission.to_i <= 22_000
      'Level 2'
    else
      'Level 1'
    end
end

def show_animal_next_level_pic
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'trophy.svg'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'bird.svg'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'owl.svg'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'penguin.svg'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'fox.svg'
    elsif @user.daily_emission.to_i > 19_300 && @user.daily_emission.to_i <= 22_000
      'lion.svg'
    else
      'bear.svg'
    end
end

def show_animal_back_level
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'Level 5'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'Level 4'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'Level 3'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'Level 2'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'Level 1'
    else
      'Level 0'
    end
end

def show_animal_back_level_pic
    if @user.daily_emission.to_i > 1894 && @user.daily_emission.to_i < 8500
      'owl.svg'
    elsif @user.daily_emission.to_i > 8500 && @user.daily_emission.to_i <= 11_200
      'penguin.svg'
    elsif @user.daily_emission.to_i > 11_200 && @user.daily_emission.to_i <= 13_900
      'fox.svg'
    elsif @user.daily_emission.to_i > 13_900 && @user.daily_emission.to_i <= 16_600
      'lion.svg'
    elsif @user.daily_emission.to_i > 16_600 && @user.daily_emission.to_i <= 19_300
      'bear.svg'
    else
      'cow.svg'
    end
end


  def set_user
    @user = current_user
  end

  def filterFriends
    @searchUser = User.where('id != ?', current_user.id)
    @array_users=[]
    @searchUser.each {|user| @array_users << user}

    @friends = Friendship.where(user:current_user)
    @array_friends = []
    if @friends
      @friends.each do |friend|
        @array_friends << User.find(friend.friend_id)
      end
    end


    difference = @array_users.difference(@array_friends)
  end
end
