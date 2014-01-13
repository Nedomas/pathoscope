module ApplicationHelper
  def explore_link(resource, parameters = {})
    if resource.is_a?(String)
      resource
    elsif params[:controller]
      ego_link_path(resource)
    else
      explore_path(resource)
***REMOVED***
***REMOVED***
***REMOVED***
