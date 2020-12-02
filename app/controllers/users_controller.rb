class UsersController < ApplicationController
  def show
    # dashboard
    @user = current_user
    # @recent_challenges = User_challenges.order(created_at: :desc).take(4)
  end

end
