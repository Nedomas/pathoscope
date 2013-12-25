class Node < ActiveRecord::Base
  has_one :link
  belongs_to :path
  belongs_to :user

  has_ancestry cache_depth: true

  class << self
    def build(url, path, user)
      link = Link.find_or_create_by(url: url)

      create(link_id: link.id, path_id: path.id, user_id: user.id,
        parent: last_in_path(path, user))
***REMOVED***

    def last_in_path(path, user)
      where(path_id: path.id, user_id: user.id).last
***REMOVED***
***REMOVED***
***REMOVED***
