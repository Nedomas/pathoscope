class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
***REMOVED***

    add_index :comments, [:commentable_id, :commentable_type]
***REMOVED***
***REMOVED***
