class PathSerializer < ApplicationSerializer
  attributes :id, :title, :color, :users_count, :links_count, :item_id, :user_path_ids

  def item_id
    object.item.id
***REMOVED***

  def users_count
    object.users.count
***REMOVED***

  def links_count
    object.links.count
***REMOVED***
***REMOVED***
