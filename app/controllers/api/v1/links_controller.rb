class Api::V1::LinksController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    links = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: LinkSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    render json: {
      links: links,
      items: items,
      paths: paths,
      notes: notes
    }
  end

  def show
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    render json: {
      link: LinkSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: items,
      paths: paths,
      notes: notes
    }
  end

  def create
    link = params[:link]
    path = Path.find(link[:creation_path_id])
    user = User.find(link[:creation_user_id])
    node = Node.build(link[:url], path, user)
    link = node.item.context

    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    render json: {
      link: LinkSerializer.new(link).serializable_hash,
      items: items,
      paths: paths,
      notes: notes
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

