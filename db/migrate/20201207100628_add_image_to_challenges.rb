class AddImageToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :image, :string
  end
end
