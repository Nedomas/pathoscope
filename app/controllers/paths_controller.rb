class PathsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @paths = Path.all
***REMOVED***

  def show
    @path = Path.find(params[:id])
    @forward_links = Explore.root_links(@path)
    @back_collection = {}
***REMOVED***

***REMOVED***
