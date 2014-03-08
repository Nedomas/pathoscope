class UserPathSerializer < ApplicationSerializer
***REMOVED*** has_many :items, embed: :ids
  attributes :item_ids
  has_one :path
  has_one :user
***REMOVED***
