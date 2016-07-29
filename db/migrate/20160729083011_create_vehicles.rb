class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.belongs_to :vehicle_type, index: true
      t.belongs_to :engine, index: true
      t.string :color
      t.date :st_date
      t.date :del_date
      t.string :vehicle_type_id
      t.integer :engine_id

      t.timestamps
    end
  end
end
