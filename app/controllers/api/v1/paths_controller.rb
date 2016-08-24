class Api::V1::PathsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  # before_filter :set_current_user
  # def set_current_user
  #   binding.pry
  #   User.current = current_user
  # end

  def index
    serialized_paths = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: PathSerializer).serializable_array
    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    render json: {
      paths: serialized_paths,
      items: serialized,
      user_paths: user_paths
    }
# , meta: { current_user: current_user }
  end

  def show
    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    render json: {
      path: PathSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: serialized,
      user_paths: user_paths
    }
# , meta: { current_user: current_user }
    # respond_with MODEL.find(params[:id])
  end

  def create
    path = params[:path]
    user = User.find(path[:creation_user_id])
    node = Node.build_path(path[:title], user)

    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    user_paths = ActiveModel::ArraySerializer.new(UserPath.all,
      each_serializer: UserPathSerializer).serializable_array

    render json: {
      path: PathSerializer.new(node.path).serializable_hash,
      items: serialized,
      user_paths: user_paths
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

