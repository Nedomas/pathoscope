class Link < ActiveRecord::Base
  has_many :nodes
  after_create :get_title!, :get_thumbnail!
  fuzzily_searchable :title
  has_many :comments, as: :commentable

  def get_title!
    doc = Pismo::Document.new(url)
    self.title = doc.title
    save!
***REMOVED***

  def get_thumbnail!
    Webshot.capybara_setup!
    ws = Webshot::Screenshot.new
    ws.capture(url, thumbnail_path, width: 200, height: 200, quality: 100)
***REMOVED***

  def thumbnail_path
    "public/thumbnails/#{id}.png"
***REMOVED***

  def image_path
    "/thumbnails/#{id}.png"
***REMOVED***

  def color
    'link'
***REMOVED***

***REMOVED***
