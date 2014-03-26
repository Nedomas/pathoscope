class AddInstalledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :installed, :boolean, default: false
***REMOVED***
***REMOVED***
