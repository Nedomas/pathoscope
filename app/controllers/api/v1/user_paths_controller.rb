class Api::V1::UserPathsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    respond_with MODEL.where(user_id: current_user.andand.id)
***REMOVED***

  def show
    respond_with MODEL.first
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


