class Api::V1::ExpertiseController < ApplicationController
  def road
    path_item = Path.find(params[:path_id]).item
    path_road = recursive_find_children(path_item, [path_item]).map(&:id)

    r***REMOVED***er json: {
      path_road: path_road
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
