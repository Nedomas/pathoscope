class ItemSerializer < ApplicationSerializer
  attributes *Item.column_names.map(&:to_sym).concat([:context, :link, :path])

  def context
    object.context
***REMOVED***

  def link
    object.context if object.link?
***REMOVED***

  def path
    object.context if object.path?
***REMOVED***
***REMOVED***

