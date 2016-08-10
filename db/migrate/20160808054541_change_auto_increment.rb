class ChangeAutoIncrement < ActiveRecord::Migration[5.0]
 def self.up
    execute "ALTER TABLE vehicles AUTO_INCREMENT=1001;"
  end

end














