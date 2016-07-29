class CreateEngines < ActiveRecord::Migration[5.0]
  def change
    create_table :engines do |t|
      t.string :fuel
      t.integer :power_rating

      t.timestamps
    end
  end
end
