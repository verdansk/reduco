class AddValueToTransport < ActiveRecord::Migration[6.0]
  def change
    add_column :transports, :value, :integer
  end
end
