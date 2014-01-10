class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title

  def roots
    nodes.roots.order(:id)
***REMOVED***

  def image_path
***REMOVED***
***REMOVED***
