class Api::V1::UsersController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    users = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: UserSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    r***REMOVED***er json: {
      users: users,
      notes: notes,
      paths: paths,
      items: items
    }
***REMOVED***

  def show
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    r***REMOVED***er json: {
      user: UserSerializer.new(MODEL.find(params[:id])).serializable_hash,
      notes: notes,
      paths: paths,
      items: items
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

  def sign_out
    r***REMOVED***er :nothing
***REMOVED***

  private

  def permitted_params
    params.require(controller_name.singularize.to_sym).permit(*MODEL.column_names.map(&:to_sym))
***REMOVED***
***REMOVED***

