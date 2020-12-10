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
      @count = Friendship.where(user:current_user,friendship_status:"pending").count
      redirect_to user_path(current_user)
    end
    req = render_to_string(partial: "shared/requestsIncoming", locals: { friendship:  @reverseFriendship})
    noti = render_to_string(partial: "shared/notifications", locals: { count: @count})
    UserChannel.broadcast_to(
      @friend_user, {notification:noti, request: req}
    )
  end

  def accept
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user:current_user,friend:@friend)
    @reversefriendship = Friendship.where(user:@friend,friend:current_user)
    @friends = Friendship.where(user:@friend,friend:current_user)
    @friendship.first.accepted!
    @reversefriendship.first.accepted!

    friend = render_to_string(partial: "users/friend-list", locals: { friendship:  @friends})
    UserChannel.broadcast_to(
      @friend, {friend:friend}
    )
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
