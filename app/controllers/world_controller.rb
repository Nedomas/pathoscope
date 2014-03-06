class WorldController < ApplicationController
  before_action :authenticate_user!

  def show
    gon.item_id = params[:item_id]
***REMOVED***

  def index
    redirect_to world_path(1) and return if request.format.html?

    center = Item.find(params[:item_id])
    relevant_nodes = center.nodes.map do |node|
      node.parent ? node.parent.siblings : node.siblings
***REMOVED***.flatten.uniq
    item_tree = relevant_nodes.map do |node|
      itemize(node.subtree(to_depth: 3).arrange)
***REMOVED***

    structure = item_tree.flatten.deep_compact
    open_roots = center.nodes.map(&:parent).uniq.compact.map(&:item_id)

    links = Array(Link.all).join_with_extra_fields
    paths = Array(Path.all).join_with_extra_fields

    items = Item.all.each_with_object({}) do |item, obj|
      item_paths = item.context.paths.map(&:id).sort rescue []

      obj[item.id] = item.attributes.merge(
        title: item.context.title,
        paths: item_paths
      )
***REMOVED***

    r***REMOVED***er json: {
      structure: structure,
      links: links,
      items: items,
      paths: paths,
      center: center.id,
      open_roots: open_roots
    }
***REMOVED***

  def itemize(obj)
    obj.each_with_object([]) { |(k,v), obj| obj << { k.item.id => itemize(v) } }
***REMOVED***

***REMOVED***
