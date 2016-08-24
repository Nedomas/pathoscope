class AddUserPaths < ActiveRecord::Migration
  def self.up
    create_table :user_paths do |t|
      t.integer :user_id
      t.integer :path_id
    end
  end

  def self.down
    drop_table :user_paths
  end
end
