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
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    if params[:username]
      users = ActiveModel::ArraySerializer.new(MODEL.where(username: params[:username]),
        each_serializer: UserSerializer).serializable_array

      render json: {
        users: users,
        notes: notes,
        paths: paths,
        items: items,
        user_paths: user_paths
      } and return
    end


    render json: {
      users: users,
      notes: notes,
      paths: paths,
      items: items,
      user_paths: user_paths
    }
  end

  def show
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    render json: {
      user: UserSerializer.new(MODEL.find(params[:id])).serializable_hash,
      notes: notes,
      paths: paths,
      items: items,
      user_paths: user_paths
    }
  end

  def create
    @model = MODEL.create(permitted_params)
    respond_with @model
  end

  def update
    @model = MODEL.find(params[:id])
    @model.update_attributes(permitted_params)

    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    render json: {
      user: UserSerializer.new(MODEL.find(params[:id])).serializable_hash,
      notes: notes,
      paths: paths,
      items: items,
      user_paths: user_paths
    }
  end

  def destroy
    @model = MODEL.find(params[:id])
    @model.destroy
    respond_with @model
  end

  private

  def permitted_params
    params.require(controller_name.singularize.to_sym).permit(*MODEL.column_names.map(&:to_sym))
  end
end

