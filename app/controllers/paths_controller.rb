class PathsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @paths = Path.all
    @root_links_in_paths = Path.all.each_with_object({}) do |path, obj|
      obj[path] = Explore.root_links(path)
***REMOVED***
***REMOVED***

  def show
    @path = Path.find(params[:id])
    @forward_links = Explore.root_links(@path)
    @back_collection = {}
***REMOVED***

***REMOVED***
