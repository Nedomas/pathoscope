class LinkSerializer < ApplicationSerializer
  attributes *Link.column_names.map(&:to_sym)
***REMOVED***
