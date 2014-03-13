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

    r***REMOVED***er json: {
      links: links,
      items: items,
      paths: paths,
      notes: notes
    }
***REMOVED***

  def show
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    r***REMOVED***er json: {
      link: LinkSerializer.new(MODEL.find(params[:id])).serializable_hash,
      items: items,
      paths: paths,
      notes: notes
    }
***REMOVED***

  def create
    link = params[:link]
    path = Path.find(link[:creation_path_id])
    node = Node.build(link[:url], path, current_user)
    link = node.item.context

  ***REMOVED*** links = ActiveModel::ArraySerializer.new(MODEL.all,
  ***REMOVED***   each_serializer: LinkSerializer).serializable_array
    items = ActiveModel::ArraySerializer.new(Item.all,
      each_serializer: ItemSerializer).serializable_array
    paths = ActiveModel::ArraySerializer.new(Path.all,
      each_serializer: PathSerializer).serializable_array
    notes = ActiveModel::ArraySerializer.new(Note.all,
      each_serializer: NoteSerializer).serializable_array

    r***REMOVED***er json: {
      link: LinkSerializer.new(link).serializable_hash,
      items: items,
      paths: paths,
      notes: notes
    }
  ***REMOVED*** r***REMOVED***er :nothing => true, :status => 204 and return
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

