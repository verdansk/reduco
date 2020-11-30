class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :duration
      t.integer :xp
      t.text :description
      t.integer :emission_saving

      t.timestamps
    end
  end
end
