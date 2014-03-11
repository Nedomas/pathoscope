class LinkSerializer < ApplicationSerializer
  attributes *Link.column_names.map(&:to_sym).concat([:item_id])

  def item_id
    object.item.id
***REMOVED***
***REMOVED***
