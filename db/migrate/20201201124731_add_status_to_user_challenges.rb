class AddStatusToUserChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :user_challenges, :status, :integer
  end
end
