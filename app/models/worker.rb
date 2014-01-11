class Worker
  class << self
    def get_thumbnails
      Webshot.capybara_setup!
      ws = Webshot::Screenshot.new

      Link.all.each do |link|
        puts "Getting thumbnail for #{link.url}"
        ws.capture(link.url, link.thumbnail_path)
  ***REMOVED***

      puts "Done"
***REMOVED***

    def update_fuzzy
      [Link, Path].each do |model|
        model.bulk_update_fuzzy_title
  ***REMOVED***
***REMOVED***

    def update_path_descriptions
      Path.all.each do |path|
        wiki = Wikipedia::article(path.title)
        path.update_attribute(:description, wiki.first)
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
