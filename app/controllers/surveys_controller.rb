class SurveysController < ApplicationController
  def new
    @user = current_user
    @users = User.all
    @transport = Transport.new
  end

  def create
    raise
  end
end
