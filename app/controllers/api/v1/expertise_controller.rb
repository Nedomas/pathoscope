class Api::V1::ExpertiseController < ApplicationController
  def road
    path_item = Path.find(params[:path_id]).item
    path_road = recursive_find_children(path_item, [path_item]).reject(&:path?).map(&:id)
    path_road_with_path = [path_item.id] + path_road

    r***REMOVED***er json: {
      path_road: path_road_with_path
    }
***REMOVED***

  def recursive_find_children(item, parents)
    longest_path = []
    item.children.each do |child|
      next if parents.include?(child)
      path = recursive_find_children(child, parents + [child])
      longest_path = path if longest_path.size < path.size
***REMOVED***

    [item] + longest_path
***REMOVED***
***REMOVED***
