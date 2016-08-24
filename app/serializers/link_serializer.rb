class LinkSerializer < ApplicationSerializer
  attributes *Link.column_names.map(&:to_sym).concat([:item_id, :path_ids])

  def item_id
    object.item.id
  end

  def path_ids
    object.paths.map(&:id)
  end
end
