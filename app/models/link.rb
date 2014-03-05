class Link < ActiveRecord::Base
  has_many :nodes
  after_create :get_title!
***REMOVED*** , :get_screens!
  fuzzily_searchable :title
  has_many :comments, as: :commentable
  has_one :item, as: :context

  EXTRA_FIELDS = [:item_id, :short_title, :short_url, :path_ids].freeze

  def item_id
    item.id
***REMOVED***

  def short_title
    title.andand.truncate(50)
***REMOVED***

  def short_url
    URI(url).host.gsub('www.', '')
***REMOVED***

  def get_title!
    doc = Pismo::Document.new(url) rescue doc = OpenStruct.new(title: 'None')
    self.title = doc.title
    save!
***REMOVED***

  def get_screens!
    Webshot.capybara_setup!
    ws = Webshot::Screenshot.new
    capture_thumbnail(ws)
    capture_screenshot(ws)
***REMOVED***

  def capture_thumbnail(ws)
    ws.capture(url, save_thumbnail_path, width: 100, height: 100, quality: 100)
***REMOVED***

  def capture_screenshot(ws)
    ws.capture(url, save_screenshot_path, width: 768, height: 900, quality: 100)
***REMOVED***

  def save_thumbnail_path
    "public/thumbnails/#{id}.png"
***REMOVED***

  def save_screenshot_path
    "public/screenshots/#{id}.png"
***REMOVED***

  def thumbnail_path
    "/thumbnails/#{id}.png"
***REMOVED***

  def external_thumbnail_path
    SERVER + thumbnail_path
***REMOVED***

  def screenshot_path
    "/screenshots/#{id}.png"
***REMOVED***

  def hover_content
    "<img src='#{screenshot_path}' height='600'>"
***REMOVED***

  def color
    'link'
***REMOVED***

  def paths
    item.nodes.map(&:path).uniq
***REMOVED***

  def path_ids
    item.nodes.map(&:path_id).uniq.sort
***REMOVED***
***REMOVED***
