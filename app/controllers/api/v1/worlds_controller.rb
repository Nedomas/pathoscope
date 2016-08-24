class Api::V1::WorldsController < ApplicationController
  respond_to :json

  def index
    if id = params[:id]
      render json: {
        worlds: [all_records([id]).last],
        # meta: { current_user: current_user }
      }
    elsif params[:parent_id] == ""
      render json: {
        worlds: all_records.select { |record| !record[:parent_id] },
        # meta: { current_user: current_user }
      }
    else
      render json: {
        worlds: all_records(params[:ids]),
        # meta: { current_user: current_user }
      }
    end
    # respond_with worlds: all_records
  end

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

    render json: {
      world: record,
      # meta: { current_user: current_user }
    }
  end

  def all_records(ids=nil)
    all_records = []

    nodes = if ids
      Node.find(ids)
    else
      Node.where("ancestry_depth <= ?", 1)
    end

    nodes.each do |node|
      all_records << {
        id: node.id,
        children_ids: node.child_ids,
        parent_id: node.parent_id,
        parent: node.parent,
        item: node.item,
        item_id: node.item.id
      }
    end

    all_records.uniq
  end

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
    end

    all_records.uniq
  end
end

class World
  def path_tree
    path = Path.last
    nodes = Node.where(path: path)
    last_node = Node.sort_by_ancestry(nodes).last

    result = {}
    siblings = last_node.item.nodes
    last_last = get_last_children(last_node)
    binding.pry
  end

  def get_last_children(node)
    siblings.each do |sibling|
      sibling.children.each do |child|
      end
    end
  end

  def find_no_children
    Item.all.select do |item|
      item.nodes.select {|n| n.path_id == Path.last.id }.none?
      #   binding.pry
      #   # child.children
      # end
    end
    # nodes.select do |node|
    #   node.item
    # end
    # nodes.map(&:children).flatten
  end

  def all
    result = []

    Node.all.each do |node|

    end

    binding.pry
  end

  def all_records
    all_records = []

    nodes = if ids
      Node.find(ids)
    else
      Node.where("ancestry_depth <= ?", 1)
    end

    nodes.each do |node|
      all_records << {
        id: node.id,
        children_ids: node.child_ids,
        parent_id: node.parent_id,
        parent: node.parent,
        item: node.item,
        item_id: node.item.id
      }
    end

    all_records.uniq
  end
end
# class World
#   def initialize
#     @all = []
#     @id_index = 0
#   end
#
#   def add(node)
#     # @all <<
#   end
# end
