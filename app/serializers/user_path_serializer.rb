class UserPathSerializer < ApplicationSerializer
  attributes *UserPath.column_names.map(&:to_sym).concat([:item_ids, :sibling_ids])
***REMOVED***
