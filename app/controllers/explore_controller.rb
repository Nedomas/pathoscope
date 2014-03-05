class ExploreController < ApplicationController
  before_action :authenticate_user!

  def show
    gon.item_id = params[:item_id]

***REMOVED***

  def index
    redirect_to explore_path(1) and return if request.format.html?

    center = Item.find(params[:item_id])
    relevant_nodes = center.nodes.map { |node| node.parent ? node.parent : node.siblings }.flatten.uniq
    item_tree = relevant_nodes.map do |node|
      itemize(node.subtree(to_depth: 2).arrange)
***REMOVED***

    structure = item_tree.flatten.deep_compact

    links = join_with_extra_fields(Link.all)
    paths = join_with_extra_fields(Path.all)
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
      center: center.id
    }
***REMOVED***

  def join_with_extra_fields(elements)
    elements.each_with_object({}) do |element, result|
      extra_fields = element.class::EXTRA_FIELDS.each_with_object({}) do |field, obj|
        obj[field] = element.s***REMOVED***(field)
  ***REMOVED***

      result[element.id] = element.attributes.merge(extra_fields)
***REMOVED***
***REMOVED***

  def itemize(obj)
    obj.each_with_object([]) { |(k,v), obj| obj << { k.item.id => itemize(v) } }
***REMOVED***

***REMOVED***
