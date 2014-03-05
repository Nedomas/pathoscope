class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title
  fuzzily_searchable :title
  has_many :comments, as: :commentable
  before_create :add_color
  has_many :user_paths
  has_many :users, through: :user_paths
  has_one :item, as: :context

  def node
    nodes.roots.first
***REMOVED***

  def add_color
    if last_path = Path.last
      last_color = last_path.color.to_i
      last_color = -1 if last_color > 4

      self.color = last_color + 1
    else
      self.color = 1
***REMOVED***
***REMOVED***

  def roots
    nodes.roots.order(:id)
***REMOVED***

  def root_for_user(user)
    user.nodes.roots.find_by(path: self)
***REMOVED***

  def links_for_user(user)
    Node.sort_by_ancestry(Node.where(path: self, user: user))
***REMOVED***

  def screenshot_path
    '/assets/paths/aerospace.png'
***REMOVED***

  def thumbnail_path
    '/assets/paths/aerospace.png'
***REMOVED***

  def hover_content
    "<img src='#{screenshot_path}' height='600'>"
***REMOVED***

  def url
***REMOVED***

  def show_title
    title
***REMOVED***

  def show_url
***REMOVED***
***REMOVED***
