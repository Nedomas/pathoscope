class PathSerializer < ApplicationSerializer
  attributes :item_id, :item, :title, :color, :users_count, :links_count

  def item
    object.item
***REMOVED***

  def users_count
    object.users.count
***REMOVED***

  def links_count
    object.links.count
***REMOVED***
***REMOVED***
