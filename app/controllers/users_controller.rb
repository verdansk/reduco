class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def accept_challenge
    @user = User.find(params[:user_id])
  end
end
