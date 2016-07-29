class UsersVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :users_vehicles, id: false do |t|
      t.integer :user_id
      t.integer :vehicle_id
      t.timestamps
    end
  end
end
