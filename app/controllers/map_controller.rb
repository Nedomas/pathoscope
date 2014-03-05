class MapController < ApplicationController
  before_action :authenticate_user!

  def index

***REMOVED***

  def data
    map = current_user.paths.each_with_object({}) do |path, obj|
      user_path_nodes = Node.where(path: path, user: current_user)
      sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

      obj[path.item.id] = sorted_nodes.map(&:item).select { |item| item.link? }.map(&:id)
***REMOVED***

    links = Link.all.each_with_object({}) do |link, obj|
      obj[link.id] = {
        id: link.id,
        title: link.show_title,
        show_url: link.show_url,
        url: link.url,
        paths: link.path_ids
      }
***REMOVED***

    items = Item.all.each_with_object({}) do |item, obj|
      item_paths = item.context.paths.map(&:id).sort rescue []

      obj[item.id] = {
        id: item.id,
        title: item.context.title,
        show_url: item.context.andand.show_url,
        show_title: item.context.andand.show_title,
        url: item.context.andand.url,
        paths: item_paths
      }
***REMOVED***

    r***REMOVED***er json: {
      map: map,
      links: links,
      paths: Path.all.index_by(&:id),
      items: items
    }
***REMOVED***
***REMOVED***
