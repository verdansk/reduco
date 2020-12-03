class UsersController < ApplicationController
  def show
    # dashboard
    @user = current_user
    # @recent_challenges = User_challenges.order(created_at: :desc).take(4)
  end

  def accept_challenge
    @user = User.find(params[:user_id])
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
