class Worker
  class << self
    def get_thumbnails
      Webshot.capybara_setup!
      ws = Webshot::Screenshot.new

      Link.all.each do |link|
        puts "Getting thumbnail for #{link.url}"
        ws.capture(link.url, link.save_thumbnail_path, width: 100, height: 100, quality: 100)
        ws.capture(link.url, link.save_screenshot_path, width: 768, height: 900, quality: 100)
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
        api = "http://en.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&titles=#{path.title}&rvprop=content&rvsection=0&rvparse"
        resp = Faraday.get(api)
        wiki = JSON.parse(resp.body)['query']['pages'].values.first['revisions'].first['*']
        safe_wiki = ActionView::Base.full_sanitizer.sanitize(wiki)
      ***REMOVED*** wiki = Wikipedia::article(path.title)
        path.update_attribute(:description, safe_wiki)
  ***REMOVED***
***REMOVED***

    def update_link_descriptions
      Link.all.each do |link|
        doc = Pismo::Document.new(link.url)
        link.update_attributes(title: doc.title, description: doc.lede)
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
