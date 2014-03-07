class Api::V1::MapController < ApplicationController
  respond_to :json

  def index
    structure = current_user.paths.map do |path|
      user_path_nodes = Node.where(path: path, user: current_user)
      sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

      links = sorted_nodes.map(&:item).select(&:link?).map do |item|
        { item.id => [] }
  ***REMOVED***

      { path.item.id => links }
***REMOVED***
#
#     links = Array(Link.all).join_with_extra_fields
#     paths = Array(Path.all).join_with_extra_fields
#
#     items = Item.all.each_with_object({}) do |item, obj|
#       item_paths = item.context.paths.map(&:id).sort rescue []
#
#       obj[item.id] = item.attributes.merge(
#         title: item.context.title,
#         paths: item_paths
#       )
# ***REMOVED***
#
    respond_with structure
***REMOVED***
***REMOVED***

