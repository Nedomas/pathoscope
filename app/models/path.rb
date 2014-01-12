class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title
  fuzzily_searchable :title
  has_many :comments, as: :commentable

  def roots
    nodes.roots.order(:id)
***REMOVED***

  def image_path
***REMOVED***
***REMOVED***
