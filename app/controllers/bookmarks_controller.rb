class BookmarksController < ApplicationController
  def create
    query = URI::parse(params[:bookmarklet]).query
    data = Rack::Utils.parse_nested_query(query)
    path = Path.find(data['path_id'])
    url = params[:href]

  ***REMOVED*** # check if its from our app
  ***REMOVED*** if request.host == URI(url).host
  ***REMOVED***   redirect_to paths_path(path) and return
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** binding.pry

    result = {}

    if user_signed_in?
      Node.build(url, path, current_user)
      result[:logged_in] = true
    else
      result[:logged_in] = false
***REMOVED***

    r***REMOVED***er json: result
***REMOVED***

  def templates
***REMOVED***

***REMOVED***
