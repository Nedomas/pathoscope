class UserPath < ActiveRecord::Base
  belongs_to :user
  belongs_to :path

***REMOVED*** api
  def item_ids
    user_path_nodes = Node.where(path: path, user: user)
    sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

    sorted_nodes.map(&:item).select(&:link?).map(&:id)
***REMOVED***

  def items
    Item.all
***REMOVED***
***REMOVED***
