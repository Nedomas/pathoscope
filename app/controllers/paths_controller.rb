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
    @back_collection = { 'Paths index' => paths_index_url }
***REMOVED***

  def create
    if path = Path.find_by(title: params[:title])
      flash[:alert] = "#{path.title} path already exists"
    else
      title = params[:title].capitalize
      path = Path.new(title: title)

      if path.save
        flash[:notice] = "Path #{path.title} has been created"
      else
        flash[:error] = path.errors.full_messages.to_sentence
  ***REMOVED***
***REMOVED***

    redirect_to root_url
***REMOVED***
***REMOVED***
