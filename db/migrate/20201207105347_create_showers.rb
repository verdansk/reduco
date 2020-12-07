class CreateShowers < ActiveRecord::Migration[6.0]
  def change
    create_table :showers do |t|
      t.integer :duration
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
