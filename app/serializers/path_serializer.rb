class PathSerializer < ApplicationSerializer
  embed :ids, include: true
  attributes :id, :title, :color, :users_count, :links_count

***REMOVED*** def item
***REMOVED***   object.item
***REMOVED*** ***REMOVED***

  def users_count
    object.users.count
***REMOVED***

  def links_count
    object.links.count
***REMOVED***
***REMOVED***
