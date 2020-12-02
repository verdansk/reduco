class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :food_category
      t.integer :spend
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
