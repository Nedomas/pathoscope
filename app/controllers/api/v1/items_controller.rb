class Api::V1::ItemsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    serialized = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: ItemSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    r***REMOVED***er json: {
      items: serialized,
      notes: notes
    }
***REMOVED***

  def show
    serialized = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: ItemSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    r***REMOVED***er json: {
      item: ItemSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: serialized,
      notes: notes
    }
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

