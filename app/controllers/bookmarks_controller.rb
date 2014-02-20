class BookmarksController < ApplicationController
  def begin
    resp = {}

    if user_signed_in?
      resp[:logged_in] = true

      paths = current_user.paths.map do |path|
        { id: path.id, title: path.title, color: path.color, count: path.nodes.count }
  ***REMOVED***

      resp[:paths] = paths.to_json
    else
      resp[:logged_in] = false
***REMOVED***

    r***REMOVED***er json: resp
***REMOVED***

  def tag
  ***REMOVED*** User logged in
    path = Path.find(params[:path_id])
    url = params[:href]
    node = Node.build(url, path, current_user)
    r***REMOVED***er json: { node_id: node.id }
***REMOVED***

  def links
    node = Node.find(params[:node_id])
    link = { title: node.link.title, show_url: node.link.show_url }
    tag = { title: node.path.title, color: node.path.color }

    links = Explore.children_links(node.link).map do |link|
      {
        title: link.title,
        show_url: link.show_url,
        url: link.url,
        thumbnail_path: link.external_thumbnail_path,
        count: link.nodes.count
      }
***REMOVED***

    r***REMOVED***er json: { link: link, tag: tag, links: links }
***REMOVED***

***REMOVED*** def create
***REMOVED***   query = URI::parse(params[:bookmarklet]).query
***REMOVED***   data = Rack::Utils.parse_nested_query(query)
***REMOVED***   path = Path.find(1) # TODO
***REMOVED***   url = params[:href]
***REMOVED***   node = Node.build(url, path, current_user)
***REMOVED***   r***REMOVED***er json: true

***REMOVED*** ***REMOVED*** # check if its from our app
***REMOVED*** ***REMOVED*** if request.host == URI(url).host
***REMOVED*** ***REMOVED***   redirect_to paths_path(path) and return
***REMOVED*** ***REMOVED*** ***REMOVED***

***REMOVED*** ***REMOVED*** result = {}

***REMOVED*** ***REMOVED*** if user_signed_in?
***REMOVED*** ***REMOVED***   node = Node.build(url, path, current_user)
***REMOVED*** ***REMOVED***   result[:logged_in] = true

***REMOVED*** ***REMOVED***   paths = Explore.children_links(node.link).map do |link|
***REMOVED*** ***REMOVED***     { title: link.title, url: link.url, count: link.nodes.count }
***REMOVED*** ***REMOVED*** ***REMOVED***

***REMOVED*** ***REMOVED***   result[:paths] = paths.to_json
***REMOVED*** ***REMOVED*** else
***REMOVED*** ***REMOVED***   result[:logged_in] = false
***REMOVED*** ***REMOVED*** ***REMOVED***

***REMOVED*** ***REMOVED***

  def templates
***REMOVED***

***REMOVED***
