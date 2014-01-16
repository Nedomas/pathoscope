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
      ***REMOVED*** api = "http://en.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&titles=#{path.title}&rvprop=content&rvsection=0&rvparse"
      ***REMOVED*** resp = Faraday.get(api)
      ***REMOVED*** wiki = JSON.parse(resp.body)['query']['pages'].values.first['revisions'].first['*']
      ***REMOVED*** safe_wiki = ActionView::Base.full_sanitizer.sanitize(wiki)
      ***REMOVED*** wiki = Wikipedia::article(path.title)
        resp = RubyWebSearch::Google.search(:query => "define+#{path.title}")
        definition = resp.results.first[:content]
        sane_definition = ActionView::Base.full_sanitizer.sanitize(definition)
      ***REMOVED*** api = "http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=#{path.title}"
      ***REMOVED*** resp = Faraday.get(api)
      ***REMOVED*** json = resp.body.sub('a(', '').sub(',200,null)', '')
      ***REMOVED*** definition = JSON.parse(json)["primaries"].last["entries"].last["terms"].last["text"]
        path.update_attribute(:description, sane_definition)
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
