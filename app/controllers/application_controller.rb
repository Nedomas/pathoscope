class ApplicationController < ActionController::Base
***REMOVED*** Prevent CSRF attacks by raising an exception.
***REMOVED*** For APIs, you may want to use :null_session instead.
***REMOVED*** protect_from_forgery with: :exception
  before_filter :set_current_user
  def set_current_user
    User.current = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
***REMOVED***
#   def after_sign_in_path_for(resource)
#     sessions_current_path
# ***REMOVED***
#
#   def after_sign_out_path_for(resource)
#     '/home/sign_out'
# ***REMOVED***
***REMOVED***
