class CreateEmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :emissions do |t|
      t.integer :value
      t.references :relation, polymorphic: true, null: false

      t.timestamps
    end
  end
end
