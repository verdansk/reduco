class AddStatusToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :friendship_status, :integer
  end
end
