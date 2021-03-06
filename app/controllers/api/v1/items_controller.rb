class Api::V1::ItemsController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    serialized = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: ItemSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    links = ActiveModel::ArraySerializer.new(Link.all,
      each_serializer: LinkSerializer).serializable_array

    render json: {
      items: serialized,
      notes: notes,
      paths: paths,
      links: links
    }
  end

  def show
    serialized = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: ItemSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    links = ActiveModel::ArraySerializer.new(Link.all,
      each_serializer: LinkSerializer).serializable_array

    render json: {
      item: ItemSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: serialized,
      notes: notes,
      paths: paths,
      links: links
    }
  end

  def create
    @model = MODEL.create(permitted_params)

    serialized = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: ItemSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    links = ActiveModel::ArraySerializer.new(Link.all,
      each_serializer: LinkSerializer).serializable_array

    render json: {
      item: ItemSerializer.new(@model).serializable_hash,
      items: serialized,
      notes: notes,
      paths: paths,
      links: links
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

