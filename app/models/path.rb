class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title
  fuzzily_searchable :title
  acts_as_commentable

  def roots
    nodes.roots.order(:id)
***REMOVED***

  def image_path
***REMOVED***
***REMOVED***
