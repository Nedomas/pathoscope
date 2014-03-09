class Api::V1::MapsController < ApplicationController
  respond_to :json

  def index
    respond_with maps: all_records
***REMOVED***

  def show
    record = all_records.find { |record| record[:id] == params[:id].to_i }
    respond_with map: record
***REMOVED***

  def all_records
    all_records = []

    current_user.paths.each do |path|
      path_record ||= {
        id: path.item.id,
        parent_id: nil,
        children_ids: [],
        item: path.item,
        item_id: path.item.id
      }

      user_path_nodes = Node.where(path: path, user: current_user)
      sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

      sorted_nodes.map(&:item).select(&:link?).map do |link_item|
        all_records << {
          id: link_item.id,
          children_ids: [],
          parent_id: path.item.id,
          parent: path_record,
          item: link_item,
          item_id: link_item.id
        }
        path_record[:children_ids] << link_item.id
  ***REMOVED***

      all_records << path_record
***REMOVED***

    all_records
***REMOVED***
***REMOVED***

