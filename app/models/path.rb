class Path < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :title
  fuzzily_searchable :title
  has_many :comments, as: :commentable
  before_create :add_color

  def add_color
    if last_path = Path.last
      self.color = last_path.color.to_i + 1
    else
      self.color = 1
***REMOVED***
***REMOVED***

  def roots
    nodes.roots.order(:id)
***REMOVED***

  def roots_for_user(user)
    user.nodes.roots.where(path: self).order(:id)
***REMOVED***

  def screenshot_path
    '/assets/rocket2.png'
***REMOVED***

  def thumbnail_path
    '/assets/rocket2.png'
***REMOVED***

  def hover_content
    "<img src='#{screenshot_path}' height='600'>"
***REMOVED***

  def url
***REMOVED***
***REMOVED***
