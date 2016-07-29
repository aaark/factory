class UserVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.timestamps
    end

    create_table :vehicles do |t|
      t.belongs_to :vehicle_type, index: true
      t.belongs_to :engine, index: true
      t.string :color
      t.date :st_date
      t.date :del_date
      t.integer :vehicle_type_id
      t.integer :engine_id

    end

    create_table :user_vehicles, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :vehicles, index: true
      end
  end
end
