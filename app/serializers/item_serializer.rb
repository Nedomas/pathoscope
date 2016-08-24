class ItemSerializer < ApplicationSerializer
  # attributes *Item.column_names.map(&:to_sym)
  attributes *Item.column_names.map(&:to_sym).concat(
    [:child_ids, :parent_ids, :sibling_ids, :note_ids, :path_ids, :link_id])

  def context
    object.context
  end

  # def link
  #   object.context if object.link?
  # end

  # def path
  #   object.context if object.path?
  # end

  # def map_structure
  #   binding.pry

  # end

  # def map_parents
  #   user_nodes = Node.where(user: current_user) & Item.last.nodes
  #   user_nodes.map(&:path)
  #   # binding.pry
  #   # object.path if object.link?
  # end

  # def map_children
  # end

  # def map_structure
  #   current_user.paths.map do |path|
  #     user_path_nodes = Node.where(path: path, user: current_user)
  #     sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

  #     links = sorted_nodes.map(&:item).select(&:link?).map do |item|
  #       { item.id => [] }
  #     end

  #     { path.item.id => links }
  #   end
  # end
end

