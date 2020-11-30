class CreateUserChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_challenges do |t|
      t.date :start_at
      t.date :finished_at
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
