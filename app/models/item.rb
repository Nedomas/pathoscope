class Item < ActiveRecord::Base
  has_many :nodes
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
***REMOVED***
