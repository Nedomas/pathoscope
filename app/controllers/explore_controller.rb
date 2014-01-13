class ExploreController < ApplicationController
  def index
    redirect_to root_path and return
***REMOVED***

  def show
    @current_link = Link.find(params[:id])
    @forward_links = Explore.children_links(@current_link)
    nodes = @current_link.nodes
    parents = nodes.map(&:parent).compact

    zero_depth_nodes = nodes.select { |node| node.ancestry_depth == 0 }
    parent_paths = zero_depth_nodes.map(&:path).uniq

    if parents.present?
      @back_collection = parents.each_with_object({}) do |parent, obj|
        obj[parent.path] = parent.link
  ***REMOVED***
    else
      paths = nodes.map(&:path).uniq
      @back_collection = paths.each_with_object({}) do |path, obj|
        obj[path] = paths_path(path)
  ***REMOVED***
***REMOVED***

    parent_paths.each do |parent_path|
      @back_collection[parent_path] = parent_path
***REMOVED***
***REMOVED***
***REMOVED***
