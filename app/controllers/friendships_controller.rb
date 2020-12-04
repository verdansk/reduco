class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new()
    @friend_user = User.find(params[:user_id])
    @friendship.user = current_user
    @friendship.friend = @friend_user
    @reverseFriendship = Friendship.new()
    @reverseFriendship.user = @friend_user
    @reverseFriendship.friend = current_user
    @friendship.pending!
    if @friendship.save
      @reverseFriendship.received!
      @reverseFriendship.save
      redirect_to user_path(current_user)
    end

    UserChannel.broadcast_to(
      @friend_user,
      render_to_string(partial: "shared/requestsIncoming", locals: { friendship:  @reverseFriendship})
    )
  end

  def accept
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user:current_user,friend:@friend)
    @reversefriendship = Friendship.where(user:@friend,friend:current_user)
    @friendship.first.accepted!
    @reversefriendship.first.accepted!
    redirect_to user_path(current_user)


  end

  def declined
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user:current_user,friend:@friend)
    @reversefriendship = Friendship.where(user:@friend,friend:current_user)
    @friendship.first.declined!
    @reversefriendship.first.declined!
    redirect_to user_path(current_user)
  end
end
