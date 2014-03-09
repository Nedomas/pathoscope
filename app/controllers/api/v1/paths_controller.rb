class Api::V1::PathsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    r***REMOVED***er json: MODEL.all, meta: { current_user: current_user }
***REMOVED***

  def show
    r***REMOVED***er json: MODEL.find(params[:id]), meta: { current_user: current_user }
  ***REMOVED*** respond_with MODEL.find(params[:id])
***REMOVED***

  def create
    @model = MODEL.create(permitted_params)
    respond_with @model
***REMOVED***

  def update
    @model = MODEL.find(params[:id])
    @model.update_attributes(permitted_params)
    respond_with @model
***REMOVED***

  def destroy
    @model = MODEL.find(params[:id])
    @model.destroy
    respond_with @model
***REMOVED***

  private

  def permitted_params
    params.require(controller_name.singularize.to_sym).permit(*MODEL.column_names.map(&:to_sym))
***REMOVED***
***REMOVED***

