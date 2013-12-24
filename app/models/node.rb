class Node < ActiveRecord::Base
  has_one :link
  belongs_to :path
  belongs_to :user

  has_ancestry cache_depth: true
***REMOVED***
