class ItemSerializer < ApplicationSerializer
  attributes *Item.column_names.map(&:to_sym).concat(
    [:context, :children, :children_ids, :parents, :parent_ids])

  def context
    object.context
***REMOVED***

  def children
    object.nodes.map(&:children).flatten.map(&:item).uniq
***REMOVED***

  def children_ids
    children.map(&:id)
***REMOVED***

  def parents
    object.nodes.map(&:parent).flatten.compact.map(&:item).uniq
***REMOVED***

  def parent_ids
    parents.map(&:id)
***REMOVED***

***REMOVED*** def link
***REMOVED***   object.context if object.link?
***REMOVED*** ***REMOVED***

***REMOVED*** def path
***REMOVED***   object.context if object.path?
***REMOVED*** ***REMOVED***

***REMOVED*** def map_structure
***REMOVED***   binding.pry

***REMOVED*** ***REMOVED***

***REMOVED*** def map_parents
***REMOVED***   user_nodes = Node.where(user: current_user) & Item.last.nodes
***REMOVED***   user_nodes.map(&:path)
***REMOVED*** ***REMOVED*** binding.pry
***REMOVED*** ***REMOVED*** object.path if object.link?
***REMOVED*** ***REMOVED***

***REMOVED*** def map_children
***REMOVED*** ***REMOVED***

***REMOVED*** def map_structure
***REMOVED***   current_user.paths.map do |path|
***REMOVED***     user_path_nodes = Node.where(path: path, user: current_user)
***REMOVED***     sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

***REMOVED***     links = sorted_nodes.map(&:item).select(&:link?).map do |item|
***REMOVED***       { item.id => [] }
***REMOVED*** ***REMOVED***

***REMOVED***     { path.item.id => links }
***REMOVED*** ***REMOVED***
***REMOVED*** ***REMOVED***
***REMOVED***

