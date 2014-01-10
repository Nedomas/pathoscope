class Worker
  def self.get_thumbnails
    Webshot.capybara_setup!
    ws = Webshot::Screenshot.new

    Link.all.each do |link|
      puts "Getting thumbnail for #{link.url}"
      ws.capture(link.url, link.thumbnail_path)
***REMOVED***

    puts "Done"
***REMOVED***
***REMOVED***
