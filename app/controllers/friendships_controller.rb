class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new()
    @friendship.user = current_user
    @friendship.friend = User.find(params[:user_id])
    @reverseFriendship = Friendship.new()
    @reverseFriendship.user = User.find(params[:user_id])
    @reverseFriendship.friend = current_user
    if @friendship.save
      @reverseFriendship.save
      redirect_to user_path(current_user)
    end
  end
end
