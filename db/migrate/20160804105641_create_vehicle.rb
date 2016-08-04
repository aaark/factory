class CreateVehicle < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
        t.string :color
        t.date :st_date
        t.date :del_date
        t.string :fuel
        t.integer :power_rating
        t.string :type_name
        t.integer :wt_oc
        t.timestamps
    end
  end
end
