class CreateTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :transports do |t|
      t.string :category
      t.string :fuel
      t.float :distance
      t.float :fuel_consumption
      t.date :happened_at
      t.references :user, null: false, foreign_key: true
      t.date :due_date
      t.timestamps
    end
  end
end
