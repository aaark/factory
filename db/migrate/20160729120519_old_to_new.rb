class OldToNew < ActiveRecord::Migration[5.0]
  def change
    def change
      rename_table :user_vehicles, :users_vehicles
    end

  end
end
