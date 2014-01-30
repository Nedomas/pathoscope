class AddUserPaths < ActiveRecord::Migration
  def self.up
    create_table :user_paths, id: false do |t|
      t.integer :user_id
      t.integer :path_id
***REMOVED***
***REMOVED***

  def self.down
    drop_table :user_paths
***REMOVED***
***REMOVED***
