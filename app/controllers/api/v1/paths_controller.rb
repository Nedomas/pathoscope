class Api::V1::PathsController < ApplicationController
  respond_to :json

  def index
    respond_with Path.all
***REMOVED***

  private

  def path_params
    params.require(:path).permit(:title, :color)
***REMOVED***
***REMOVED***
