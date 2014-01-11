class ExploreController < ApplicationController
  def index
    redirect_to root_path and return
***REMOVED***

  def show
    @current_link = Link.find(params[:id])
    @forward_links = Explore.children_links(@current_link)
    nodes = @current_link.nodes
    parents = nodes.map(&:parent).compact

    if parents.present?
      @back_collection = parents.each_with_object({}) do |parent, obj|
        obj[parent.path.title] = parent.link
  ***REMOVED***
    else
      paths = nodes.map(&:path).uniq
      @back_collection = paths.each_with_object({}) do |path, obj|
        obj[path.title] = paths_path(path)
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
