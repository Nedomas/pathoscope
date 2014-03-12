class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :item, index: true
      t.references :user, index: true

      t.timestamps
***REMOVED***
***REMOVED***
***REMOVED***
