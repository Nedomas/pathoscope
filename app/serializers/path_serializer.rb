class PathSerializer < ApplicationSerializer
  attributes :id, :title, :color, :users_count, :links_count, :item_id, :user_path_ids, :chosen

  def item_id
    object.item.id
  end

  def users_count
    object.users.count
  end

  def links_count
    object.links.count
  end
end
