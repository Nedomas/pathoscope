class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :set_current_user
  def set_current_user
    User.current = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
#   def after_sign_in_path_for(resource)
#     sessions_current_path
#   end
#
#   def after_sign_out_path_for(resource)
#     '/home/sign_out'
#   end
end
