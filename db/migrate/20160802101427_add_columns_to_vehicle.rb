class AddColumnsToVehicle < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :fuel, :string
    add_column :vehicles, :power_rating, :integer
    add_column :vehicles, :type_name, :string
    add_column :vehicles, :wt_oc, :integer
  end
end
