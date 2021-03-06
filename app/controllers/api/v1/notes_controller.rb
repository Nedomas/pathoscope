class Api::V1::NotesController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    notes = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: NoteSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array

    render json: {
      notes: notes,
      items: items,
      users: users
    }
  end

  def show
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array

    render json: {
      note: NoteSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: items,
      users: users
    }
  end

  def create
    Note.create(permitted_params)

    notes = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: NoteSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    users = ActiveModel::ArraySerializer.new(User.all,
      each_serializer: UserSerializer).serializable_array

    render json: {
      notes: notes,
      items: items,
      users: users
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


