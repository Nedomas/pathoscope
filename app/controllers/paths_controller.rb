class PathsController < ApplicationController
  before_action :authenticate_user!

  def index
    @paths = Path.all.sort_by { |path| path.nodes.count }.reverse
***REMOVED***

  def show
    @path = Path.find(params[:id])
    @forward_links = Explore.root_links(@path)
    @back_collection = {}
***REMOVED***

***REMOVED***
