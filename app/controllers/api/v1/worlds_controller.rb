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
    node = Node.find(params[:id])
    record = {
      id: node.id,
      children_ids: node.child_ids,
      parent_id: node.parent_id,
      parent: node.parent,
      item: node.item,
      item_id: node.item.id
    }

    r***REMOVED***er json: {
      world: record,
      meta: { current_user: current_user }
    }
***REMOVED***

  def all_records(ids=nil)
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
***REMOVED***

    all_records.uniq
***REMOVED***

  def item_structure
    result = []

    nodes.each do |node|
      all_records << {
        id: node.id,
        children_ids: node.child_ids,
        parent_id: node.parent_id,
        parent: node.parent,
        item: node.item,
        item_id: node.item.id
      }
***REMOVED***

    all_records.uniq
***REMOVED***
***REMOVED***

class World
  def all
    result = []

    Node.all.each do |node|

***REMOVED***

    binding.pry
***REMOVED***

  def all_records(ids=nil)
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
***REMOVED***

    all_records.uniq
***REMOVED***
***REMOVED***
# class World
#   def initialize
#     @all = []
#     @id_index = 0
# ***REMOVED***
#
#   def add(node)
#   ***REMOVED*** @all <<
# ***REMOVED***
# ***REMOVED***
