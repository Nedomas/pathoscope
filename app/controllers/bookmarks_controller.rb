class BookmarksController < ApplicationController
  def begin
  ***REMOVED*** resp = {}

  ***REMOVED*** if user_signed_in?
  ***REMOVED***   resp[:logged_in] = true

  ***REMOVED***   paths = current_user.paths.map do |path|
  ***REMOVED***     { id: path.id, title: path.title, color: path.color, count: path.nodes.count }
  ***REMOVED*** ***REMOVED***

  ***REMOVED***   resp[:paths] = paths.to_json
  ***REMOVED*** else
  ***REMOVED***   resp[:logged_in] = false
  ***REMOVED*** ***REMOVED***

    r***REMOVED***er json: {
      logged_in: user_signed_in?
    }
***REMOVED***

  def redirect_explore
    redirect_to '/beta#/explore'
***REMOVED***

  def data
    links = Array(Link.all).join_with_extra_fields
    paths = Array(Path.all).join_with_extra_fields

    user_path_item_ids = current_user.paths.map(&:item_id)
    links = Array(Link.all).join_with_extra_fields
    paths = Array(Path.all).join_with_extra_fields

    items = Item.all.each_with_object({}) do |item, obj|
      item_paths = item.context.paths.map(&:id).sort rescue []

      obj[item.id] = item.attributes.merge(
        title: item.context.title,
        paths: item_paths
      )
***REMOVED***

    r***REMOVED***er json: {
      user_path_item_ids: user_path_item_ids,
      links: links,
      paths: paths,
      items: items
    }
***REMOVED***

  def tag
  ***REMOVED*** User logged in
    item = Item.find(params[:item_id])
    path = item.context
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
    r***REMOVED***er layout: false
***REMOVED***

***REMOVED***
