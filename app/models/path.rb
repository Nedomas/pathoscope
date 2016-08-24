class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title
  has_many :comments, as: :commentable
  before_create :add_color
  has_many :user_paths
  has_many :users, through: :user_paths
  has_one :item, as: :context

  EXTRA_FIELDS = [:item_id].freeze

  def item_id
    item.id
  end

  def node
    nodes.roots.first
  end

  def links
    nodes.map(&:item).select(&:link?).uniq
  end

  def add_color
    if last_path = Path.last
      last_color = last_path.color.to_i
      last_color = -1 if last_color > 4

      self.color = last_color + 1
    else
      self.color = 1
    end
  end

  def roots
    nodes.roots.order(:id)
  end

  def root_for_user(user)
    user.nodes.roots.find_by(path: self)
  end

  def links_for_user(user)
    Node.sort_by_ancestry(Node.where(path: self, user: user))
  end

  def screenshot_path
    '/assets/paths/aerospace.png'
  end

  def thumbnail_path
    '/assets/paths/aerospace.png'
  end

  def hover_content
    "<img src='#{screenshot_path}' height='600'>"
  end

  def url
  end

  def show_title
    title
  end

  def show_url
  end

  def chosen
    if User.current
      User.current.user_paths.map(&:path).include?(self)
    else
      false
    end
  end
end
