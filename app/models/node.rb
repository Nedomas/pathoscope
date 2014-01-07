class Node < ActiveRecord::Base
  has_one :link
  belongs_to :path
  belongs_to :user

  has_ancestry cache_depth: true

  class << self
    def build(url, path, user)
      url = clean_url(url)
      link = Link.find_or_create_by(url: url)

      find_by(link_id: link.id, path_id: path.id, user_id: user.id) ||
        create(link_id: link.id, path_id: path.id, user_id: user.id,
          parent: last_in_path(path, user))
***REMOVED***

    def last_in_path(path, user)
      where(path_id: path.id, user_id: user.id).last
***REMOVED***

    def clean_url(url)
      url.sub(/(\/)+$/, '').sub(/(#)+$/, '')
***REMOVED***
***REMOVED***

  def link
    Link.find(link_id)
***REMOVED***

  def url
    link.url
***REMOVED***

  def path
    Path.find(path_id)
***REMOVED***
***REMOVED***
