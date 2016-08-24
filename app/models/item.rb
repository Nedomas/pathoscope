class Item < ActiveRecord::Base
  has_many :nodes
  has_many :notes
  belongs_to :context, polymorphic: true

  class << self
    def find_or_create_link(url)
      link = Link.find_or_create_by(url: url)
      find_or_create_by(context: link)
    end

    def create_path(title)
      path = Path.create(title: title)
      find_or_create_by(context: path)
    end
  end

  def path?
    context_type == 'Path'
  end

  def link?
    context_type == 'Link'
  end

  def paths
    nodes.map(&:path).uniq
  end

  def path_ids
    paths.map(&:id)
  end

  def link_id
    context.id if link?
  end

  def children
    nodes.map(&:children).flatten.map(&:item).uniq
  end

  def child_ids
    nodes.map(&:children).flatten.map(&:item).uniq.map(&:id)
  end

  def parent_ids
    nodes.map(&:parent).flatten.compact.map(&:item).uniq.map(&:id)
  end

  def siblings
    nodes.map(&:siblings).flatten.compact.map(&:item).uniq
  end

  def sibling_ids
    nodes.map(&:siblings).flatten.compact.map(&:item).uniq.map(&:id) - [id]
  end
end
