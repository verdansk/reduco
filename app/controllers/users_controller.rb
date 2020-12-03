class UsersController < ApplicationController
  def show
    # dashboard
    @users = User.all
    @user = current_user
    @query = "Search a friend.."
    # @recent_challenges = User_challenges.order(created_at: :desc).take(4)
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end



  def destroy
    current_user.destroy
    redirect_to root_path
  end
end
