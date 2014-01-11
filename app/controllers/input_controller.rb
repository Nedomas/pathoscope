class InputController < ApplicationController
  def search
    term = params[:term]
    paths = Path.find_by_fuzzy_title(term)

    links_by_title = Link.find_by_fuzzy_title(term)
    links_by_url = Link.where('url LIKE ?', "%#{term}%")
    links = (links_by_title + links_by_url).uniq

    r***REMOVED***er json: {
      paths: paths,
      links: links
    }
***REMOVED***

  def create
    title = params[:title]

    if path = Path.find_by(title: title)
      flash[:alert] = "#{path.title} path already exists"
    else
      title.capitalize!
      path = Path.new(title: title)

      if path.save
        flash[:notice] = "Path #{path.title} has been created"
      else
        flash[:error] = path.errors.full_messages.to_sentence
  ***REMOVED***
***REMOVED***

    r***REMOVED***er json: true
***REMOVED***

***REMOVED***
