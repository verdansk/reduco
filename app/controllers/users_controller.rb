class UsersController < ApplicationController
  def show
    # dashboard
    @user = current_user
    @challenges = UserChallenge.where(user_id: @user.id)
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end
end
