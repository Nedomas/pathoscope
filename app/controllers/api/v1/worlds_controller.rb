class Api::V1::WorldsController < ApplicationController
  respond_to :json

  def index
    if id = params[:id]
      r***REMOVED***er json: {
        worlds: [all_records([id]).last],
      ***REMOVED*** meta: { current_user: current_user }
      }
    elsif params[:parent_id] == ""
      r***REMOVED***er json: {
        worlds: all_records.select { |record| !record[:parent_id] },
      ***REMOVED*** meta: { current_user: current_user }
      }
    else
      r***REMOVED***er json: {
        worlds: all_records(params[:ids]),
      ***REMOVED*** meta: { current_user: current_user }
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
    ***REMOVED*** meta: { current_user: current_user }
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
  def path_tree
    path = Path.last
    nodes = Node.where(path: path)
    last_node = Node.sort_by_ancestry(nodes).last

    result = {}
    siblings = last_node.item.nodes
    last_last = get_last_children(last_node)
    binding.pry
***REMOVED***

  def get_last_children(node)
    siblings.each do |sibling|
      sibling.children.each do |child|
  ***REMOVED***
***REMOVED***
***REMOVED***

  def find_no_children
    Item.all.select do |item|
      item.nodes.select {|n| n.path_id == Path.last.id }.none?
    ***REMOVED***   binding.pry
    ***REMOVED*** ***REMOVED*** child.children
    ***REMOVED*** ***REMOVED***
***REMOVED***
  ***REMOVED*** nodes.select do |node|
  ***REMOVED***   node.item
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** nodes.map(&:children).flatten
***REMOVED***

  def all
    result = []

    Node.all.each do |node|

***REMOVED***

    binding.pry
***REMOVED***

  def all_records
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
