class Path < ActiveRecord::Base
  has_many :nodes

  def roots
    nodes.roots.order(:id)
***REMOVED***
***REMOVED***
