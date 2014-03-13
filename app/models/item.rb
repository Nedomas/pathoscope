class Item < ActiveRecord::Base
  has_many :nodes
  has_many :notes
  belongs_to :context, polymorphic: true

  class << self
    def find_or_create_link(url)
      link = Link.find_or_create_by(url: url)
      find_or_create_by(context: link)
***REMOVED***

    def create_path(title)
      path = Path.create(title: title)
      find_or_create_by(context: path)
***REMOVED***
***REMOVED***

  def path?
    context_type == 'Path'
***REMOVED***

  def link?
    context_type == 'Link'
***REMOVED***

  def paths
    nodes.map(&:path).uniq
***REMOVED***

  def path_ids
    paths.map(&:id)
***REMOVED***

  def link_id
    context.id if link?
***REMOVED***

  def child_ids
    nodes.map(&:children).flatten.map(&:item).uniq.map(&:id)
***REMOVED***

  def parent_ids
    nodes.map(&:parent).flatten.compact.map(&:item).uniq.map(&:id)
***REMOVED***

  def sibling_ids
    nodes.map(&:siblings).flatten.compact.map(&:item).uniq.map(&:id) - [id]
***REMOVED***
***REMOVED***
