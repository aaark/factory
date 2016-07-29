class Mymg < ActiveRecord::Migration[5.0]
  def change
    change_column :vehicles, :vehicle_type_id, :integer
  end
end
