class UserChallengesController < ApplicationController
  def accept
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
      redirect_to user_path(current_user, anchor: "anchor-#{current_user.id}"), notice: 'Challenge was successfully added.'
    else
      redirect_to request.referer
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  def complete
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.completed = true
    @user_challenge.status = "finished"
    @user_challenge.user.xp.nil? ? (@user_challenge.user.xp = @user_challenge.challenge.xp) : (@user_challenge.user.xp += @user_challenge.challenge.xp)
    @user_challenge.user.save
    @user_challenge.save
    #redirect_to request.referer
  end

  def destroy
    user_challenge = UserChallenge.find(params[:id])
    user_challenge.delete
    redirect_back(fallback_location: root_path)
  end
end
