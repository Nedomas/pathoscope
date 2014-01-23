class EgoController < ApplicationController
  before_action :authenticate_user!

  def index
    @paths = current_user.paths

  ***REMOVED*** @links = @paths.each_with_object({}) do |path, obj|
  ***REMOVED***   obj[path] = Explore.links_for_user(path, current_user)
  ***REMOVED*** ***REMOVED***
***REMOVED***

  def road
    @path = Path.find(params[:id])
    @forward_links = Explore.root_links_for_user(@path, current_user)
    @back_collection = {}
  ***REMOVED*** binding.pry

  ***REMOVED*** r***REMOVED***er layout: 'application'
  ***REMOVED*** r***REMOVED***er partial: 'shared/exploration',
  ***REMOVED***   locals: {
  ***REMOVED***   back_collection: @back_collection,
  ***REMOVED***   forward_links: @forward_links,
  ***REMOVED***   current_link: @path
  ***REMOVED*** }
***REMOVED***

  def link
    @current_link = Link.find(params[:id])
    @forward_links = Explore.children_links_for_user(@current_link, current_user)
    nodes = @current_link.nodes
    parents = nodes.map(&:parent).compact

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
***REMOVED***
***REMOVED***

