class EgoController < ApplicationController
  before_action :authenticate_user!

  def index
    @paths = current_user.paths
***REMOVED***

  def road
    @path = Path.find(params[:id])
    @forward_links = Explore.root_links(@path)
    @back_collection = {}

  ***REMOVED*** r***REMOVED***er layout: 'application'
  ***REMOVED*** r***REMOVED***er partial: 'shared/exploration',
  ***REMOVED***   locals: {
  ***REMOVED***   back_collection: @back_collection,
  ***REMOVED***   forward_links: @forward_links,
  ***REMOVED***   current_link: @path
  ***REMOVED*** }
***REMOVED***

  def link
***REMOVED***
***REMOVED***
