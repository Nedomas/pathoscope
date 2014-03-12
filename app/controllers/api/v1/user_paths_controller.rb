class Api::V1::UserPathsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    user_paths = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: UserPathSerializer).serializable_array
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array

    r***REMOVED***er json: {
      users: users,
      paths: paths,
      user_paths: user_paths
    }
***REMOVED***

  def show
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array

    r***REMOVED***er json: {
      user: UserSerializer.new(MODEL.find(params[:id])).serializable_hash,
      users: users,
      paths: paths
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


