class Link < ActiveRecord::Base
  has_many :nodes
  after_create :get_title!

  def get_title!
    doc = Pismo::Document.new(url)
    self.title = doc.title
    save!
***REMOVED***
***REMOVED***
