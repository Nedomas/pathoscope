class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    return sign_in_and_redirect(resource_name, resource)
***REMOVED***

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {
        r***REMOVED***er json: {
          success: true,
          redirect: stored_location_for(scope) || after_sign_in_path_for(resource)
        }
      }
***REMOVED***
***REMOVED***

  def failure
    return r***REMOVED***er :json => {:success => false, :errors => ["Login failed."]}
***REMOVED***
***REMOVED***