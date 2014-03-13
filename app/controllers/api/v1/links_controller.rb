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

    r***REMOVED***er json: {
      links: links,
      items: items,
      paths: paths
    }
***REMOVED***

  def show
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array

    r***REMOVED***er json: {
      link: LinkSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: items,
      paths: paths
    }
***REMOVED***

  def create
    link = params[:link]
    path = Path.find(link[:paths].first)
    node = Node.build(link[:url], path, current_user)
    link = node.item.context

    links = ActiveModel::ArraySerializer.new(MODEL.all,
      each_serializer: LinkSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array

  ***REMOVED*** r***REMOVED***er json: {
  ***REMOVED***   link: LinkSerializer.new(link).serializable_hash,
  ***REMOVED***   items: items,
  ***REMOVED***   paths: paths,
  ***REMOVED***   links: links
  ***REMOVED*** }
    r***REMOVED***er :nothing => true, :status => 204 and return
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

