class Worker
  class << self
    def fix_colors
      Path.all.order(:updated_at).each do |path|
        if path.color > 4
          path.add_color
          path.save
        end
      end
    end

    def get_screens
      Webshot.capybara_setup!
      ws = Webshot::Screenshot.new

      Link.all.each do |link|
        puts "Getting thumbnail for #{link.url}"
        link.capture_thumbnail(ws) rescue nil
        link.capture_screenshot(ws) rescue nil
      end

      puts "Done"
    end

    def update_fuzzy
      [Link, Path].each do |model|
        model.bulk_update_fuzzy_title
      end
    end

    def update_path_descriptions
      Path.all.each do |path|
        # api = "http://en.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&titles=#{path.title}&rvprop=content&rvsection=0&rvparse"
        # resp = Faraday.get(api)
        # wiki = JSON.parse(resp.body)['query']['pages'].values.first['revisions'].first['*']
        # safe_wiki = ActionView::Base.full_sanitizer.sanitize(wiki)
        # wiki = Wikipedia::article(path.title)
        resp = RubyWebSearch::Google.search(:query => "define+#{path.title}")
        definition = resp.results.first[:content]
        sane_definition = ActionView::Base.full_sanitizer.sanitize(definition)
        # api = "http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=#{path.title}"
        # resp = Faraday.get(api)
        # json = resp.body.sub('a(', '').sub(',200,null)', '')
        # definition = JSON.parse(json)["primaries"].last["entries"].last["terms"].last["text"]
        path.update_attribute(:description, sane_definition)
      end
    end

    def update_link_descriptions
      Link.all.each do |link|
        doc = Pismo::Document.new(link.url)
        link.update_attributes(title: doc.title, description: doc.lede)
      end
    end
  end
end
