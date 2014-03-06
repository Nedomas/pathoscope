module ApplicationHelper
  def explore_link(resource, parameters = {})
    case resource
    when Path
      if params[:controller] == 'ego'
        ego_road_path(resource)
      else
        paths_path(resource)
  ***REMOVED***
    when Link
      if params[:controller] == 'ego'
        ego_link_path(resource)
      else
        explore_path(resource)
  ***REMOVED***
    when String
      resource
***REMOVED***
***REMOVED***

  def inline_svg(path)
    file = File.open("app/assets/images/#{path}", "rb")
    raw file.read
***REMOVED***
***REMOVED***
