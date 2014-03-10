class Api::V1::WorldsController < ApplicationController
  respond_to :json

  def index
    if id = params[:id]
      r***REMOVED***er json: {
        worlds: [all_records([id]).last],
        meta: { current_user: current_user }
      }
    elsif params[:parent_id] == ""
      r***REMOVED***er json: {
        worlds: all_records.select { |record| !record[:parent_id] },
        meta: { current_user: current_user }
      }
    else
      r***REMOVED***er json: {
        worlds: all_records(params[:ids]),
        meta: { current_user: current_user }
      }
***REMOVED***
  ***REMOVED*** respond_with worlds: all_records
***REMOVED***

  def show
  ***REMOVED*** fake_root = {
  ***REMOVED***   id: 0,
  ***REMOVED***   parent: nil,
  ***REMOVED***   parent_id: nil,
  ***REMOVED***   children_ids: Path.all.map(&:id)
  ***REMOVED*** }

  ***REMOVED*** if params[:id].to_i == 0
  ***REMOVED***   record = fake_root
  ***REMOVED*** else
    node = Node.find(params[:id])
    record = {
      id: node.id,
      children_ids: node.child_ids,
      parent_id: node.parent_id,
      parent: node.parent,
      item: node.item,
      item_id: node.item.id
    }
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** record = all_records.find { |record| record[:id] == params[:id].to_i }

    r***REMOVED***er json: {
      world: record,
      meta: { current_user: current_user }
    }
  ***REMOVED*** respond_with world: record
***REMOVED***

  def all_records(ids=nil)
  ***REMOVED*** fake_root = {
  ***REMOVED***   id: 0,
  ***REMOVED***   parent: nil,
  ***REMOVED***   parent_id: nil,
  ***REMOVED***   children_ids: Path.all.map(&:id)
  ***REMOVED*** }
    all_records = []

    nodes = if ids
      Node.find(ids)
    else
      Node.where("ancestry_depth <= ?", 1)
***REMOVED***

    nodes.each do |node|
      all_records << {
        id: node.id,
        children_ids: node.child_ids,
        parent_id: node.parent_id,
        parent: node.parent,
        item: node.item,
        item_id: node.item.id
      }
    ***REMOVED*** binding.pry if all_records.map { |r| r[:id] }.include?(node.item.id)
    ***REMOVED*** all_records << {
    ***REMOVED***   id: node.item.id,
    ***REMOVED***   children_ids: node.children.map(&:item).map(&:id).uniq,
    ***REMOVED***   parent_id: node.parent.andand.item.andand.id || 0,
    ***REMOVED***   parent: node.parent.andand.item || fake_root,
    ***REMOVED***   item: node.item,
    ***REMOVED***   item_id: node.item.id
    ***REMOVED*** }
***REMOVED***

  ***REMOVED*** binding.pry
    all_records.uniq
***REMOVED***
***REMOVED***

class World
  def initialize
    @all = []
    @id_index = 0
***REMOVED***

  def add(node)
  ***REMOVED*** @all <<
***REMOVED***
***REMOVED***