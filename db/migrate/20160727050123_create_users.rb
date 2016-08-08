class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
    execute "ALTER TABLE users AUTO_INCREMENT = 1000"

  end
end
