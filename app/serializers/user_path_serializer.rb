class UserPathSerializer < ApplicationSerializer
  attributes *UserPath.column_names.map(&:to_sym).concat(
    [])
***REMOVED*** has_many :items, embed: :ids
***REMOVED*** attributes :item_ids
***REMOVED*** has_one :path
***REMOVED*** has_one :user
***REMOVED***
