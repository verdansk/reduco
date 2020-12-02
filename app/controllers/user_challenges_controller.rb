class UserChallengesController < ApplicationController
  def create
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.new(
      challenge: @challenge,
      user: current_user,
      start_at: Date.today,
      finished_at: (Date.today + @challenge.duration),
      completed: false
      )
    @user_challenge.started!
    if @user_challenge.save
      redirect_to user_path(current_user, ), notice: 'Challenge was successfully added.'
    else
      redirect_to request.referer
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  private

  # def user_challenge_params
  #   params.require(:user_challenges).permit(:start_at, :finished_at, :completed)
  # end
end
