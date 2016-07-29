class CreateUserHasVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_has_vehicles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :vehicles, index: true
      t.integer :user_id
      t.integer :vehicle_id
      t.timestamps
    end
  end
end
