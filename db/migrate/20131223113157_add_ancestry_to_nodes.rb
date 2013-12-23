class AddAncestryToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :ancestry, :string
    add_column :nodes, :ancestry_depth, :integer, default: 0
    add_index :nodes, :ancestry
***REMOVED***
***REMOVED***
