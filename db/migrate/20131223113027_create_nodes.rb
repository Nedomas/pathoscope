class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :link, index: true
      t.references :path, index: true
      t.references :user, index: true

      t.timestamps
***REMOVED***
***REMOVED***
***REMOVED***
