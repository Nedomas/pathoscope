class ApplicationController < ActionController::Base
***REMOVED*** Prevent CSRF attacks by raising an exception.
***REMOVED*** For APIs, you may want to use :null_session instead.
***REMOVED*** protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    sessions_current_path
  ***REMOVED*** binding.pry
  ***REMOVED*** request.env['omniauth.origin'] || stored_location_for(resource) || root_path
***REMOVED***
***REMOVED***
