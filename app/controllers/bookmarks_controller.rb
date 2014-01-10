class BookmarksController < ApplicationController
  def create
    query = URI::parse(params[:bookmarklet]).query
    data = Rack::Utils.parse_nested_query(query)
    path = Path.find(1) # TODO
    url = params[:href]

  ***REMOVED*** # check if its from our app
  ***REMOVED*** if request.host == URI(url).host
  ***REMOVED***   redirect_to paths_path(path) and return
  ***REMOVED*** ***REMOVED***

    result = {}

    if user_signed_in?
      node = Node.build(url, path, current_user)
      result[:logged_in] = true

      paths = Explore.children_links(node.link).map do |link|
        { title: link.title, url: link.url, count: link.nodes.count }
  ***REMOVED***

      result[:paths] = paths.to_json
    else
      result[:logged_in] = false
***REMOVED***

    r***REMOVED***er json: result
***REMOVED***

  def templates
***REMOVED***

***REMOVED***
