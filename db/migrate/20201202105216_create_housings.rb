class CreateHousings < ActiveRecord::Migration[6.0]
  def change
    create_table :housings do |t|
      t.string :housing_category
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
