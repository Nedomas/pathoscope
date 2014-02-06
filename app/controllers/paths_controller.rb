class PathsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_path, except: :index

  def index
    @paths = Path.all.sort_by { |path| path.nodes.count }.reverse
***REMOVED***

  def show
    @forward_links = Explore.root_links(@path)
    @back_collection = {}
***REMOVED***

  def choose
    current_user.paths << @path unless current_user.paths.include?(Path.last)

    redirect_to expertise_start_path(@path)
***REMOVED***

  private

  def get_path
    @path = Path.find(params[:id])
***REMOVED***
***REMOVED***

