class Api::V1::LinksController < ApplicationController
  MODEL = const_get(controller_name.classify)
  respond_to :json

  def index
    serialized_links = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: LinkSerializer).serializable_array
    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    r***REMOVED***er json: { links: serialized_links, items: serialized }
***REMOVED***

  def show
    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    r***REMOVED***er json: {
      link: LinkSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: serialized
    }
***REMOVED***

  def create
    link = params[:link]
    path = Path.find(link[:path])
    node = Node.build(link[:url], path, current_user)
    link = node.item.context

    serialized = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array

    r***REMOVED***er json: {
      link: LinkSerializer.new(link).serializable_hash,
      items: serialized
    }
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

