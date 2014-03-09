class Api::V1::WorldsController < ApplicationController
  respond_to :json

  def index
    respond_with worlds: all_records
***REMOVED***

  def show
    record = all_records.find { |record| record[:id] == params[:id].to_i }
    respond_with world: record
***REMOVED***

  def all_records
    fake_root = {
      id: 0,
      parent: nil,
      parent_id: nil,
      children_ids: Path.all.map(&:item).map(&:id)
    }
    all_records = [fake_root]

    Node.all.each do |node|
      all_records << {
        id: node.item.id,
        children_ids: node.children.map(&:item).map(&:id).uniq,
        parent_id: node.parent.andand.item.andand.id || 0,
        parent: node.parent.andand.item || fake_root,
        item: node.item,
        item_id: node.item.id
      }
***REMOVED***

    all_records
***REMOVED***
***REMOVED***

