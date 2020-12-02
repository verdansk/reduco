class UsersController < ApplicationController
  def show
    # dashboard
    @user = current_user
  end

end
