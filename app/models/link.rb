class Link < ActiveRecord::Base
  has_many :nodes
  after_create :get_title!
  has_many :comments, as: :commentable
  has_one :item, as: :context

  EXTRA_FIELDS = [:item_id, :short_title, :short_url, :path_ids].freeze

  def item_id
    item.id
  end

  def short_title
    title.andand.truncate(50)
  end

  def short_url
    URI(url).host.gsub('www.', '')
  end

  def get_title!
    doc = Pismo::Document.new(url) rescue doc = OpenStruct.new(title: 'None')
    self.title = doc.title
    save!
  end

  def get_screens!
    Webshot.capybara_setup!
    ws = Webshot::Screenshot.new
    capture_thumbnail(ws)
    capture_screenshot(ws)
  end

  def capture_thumbnail(ws)
    ws.capture(url, save_thumbnail_path, width: 100, height: 100, quality: 100)
  end

  def capture_screenshot(ws)
    ws.capture(url, save_screenshot_path, width: 768, height: 900, quality: 100)
  end

  def save_thumbnail_path
    "public/thumbnails/#{id}.png"
  end

  def save_screenshot_path
    "public/screenshots/#{id}.png"
  end

  def thumbnail_path
    "/thumbnails/#{id}.png"
  end

  def external_thumbnail_path
    SERVER + thumbnail_path
  end

  def screenshot_path
    "/screenshots/#{id}.png"
  end

  def hover_content
    "<img src='#{screenshot_path}' height='600'>"
  end

  def color
    'link'
  end

  def paths
    item.nodes.map(&:path).uniq
  end

  def path_ids
    item.nodes.map(&:path_id).uniq.sort
  end
end
