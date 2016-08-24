class UserPath < ActiveRecord::Base
  belongs_to :user
  belongs_to :path

  # api
  def item_ids
    user_path_nodes = Node.where(path: path, user: user)
    sorted_nodes = Node.sort_by_ancestry(user_path_nodes)

    sorted_nodes.map(&:item).select(&:link?).map(&:id)
  end

  def items
    Item.all
  end

  def siblings
    UserPath.where(user: user) - [self]
  end

  def sibling_ids
    siblings.map(&:id)
  end
end
