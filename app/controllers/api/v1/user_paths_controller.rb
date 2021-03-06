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
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    render json: {
      users: users,
      paths: paths,
      user_paths: user_paths,
      items: items
    }
  end

  def show
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    render json: {
      user_path: UserPathSerializer.new(MODEL.find(params[:id])).serializable_hash,
      users: users,
      paths: paths,
      items: items
    }
  end

  def create
    user_path = params[:user_path]
    path = Path.find(user_path[:path_id])
    user = User.find(user_path[:user_id])

    created_user_path = UserPath.create(user: user, path: path)

    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    render json: {
      user_path: UserPathSerializer.new(created_user_path).serializable_hash,
      users: users,
      paths: paths,
      items: items
    }
  end

  def update
    @model = MODEL.find(params[:id])
    @model.update_attributes(permitted_params)
    respond_with @model
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


