class Node < ActiveRecord::Base
  belongs_to :item
  belongs_to :path
  belongs_to :user

  has_ancestry cache_depth: true

  class << self
    def build(url, path, user)
      user.paths << path unless user.paths.include?(path)
      user.update_attribute(:installed, true) unless user.installed

      url = clean_url(url)
      return unless url

      item = Item.find_or_create_link(url)

      find_by(item_id: item.id, path_id: path.id, user_id: user.id) ||
        create(item_id: item.id, path_id: path.id, user_id: user.id,
          parent: last_in_path(path, user) || path.node)
***REMOVED***

    def build_path(title, user)
      item = Item.create_path(title.capitalize)
      path = item.context
      user.paths << path unless user.paths.include?(path)

      create(item_id: item.id, path_id: path.id, user_id: user.id)
***REMOVED***

    def last_in_path(path, user)
      where(path_id: path.id, user_id: user.id).last
***REMOVED***

    def clean_url(url)
      url.andand.sub(/(\/)+$/, '').andand.sub(/(#)+$/, '')
***REMOVED***
***REMOVED***

  def path
    Path.find(path_id)
***REMOVED***

  def url
    link.url
***REMOVED***

***REMOVED***
