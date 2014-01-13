class AddDescriptionToPath < ActiveRecord::Migration
  def change
    add_column :paths, :description, :text, after: :url
***REMOVED***
***REMOVED***
