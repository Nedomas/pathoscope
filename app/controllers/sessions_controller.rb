class SessionsController < Devise::SessionsController

***REMOVED*** def after_sign_in_path_for(resource)
***REMOVED***     request.env['omniauth.origin'] || stored_location_for(resource) || paths_index_url
***REMOVED*** ***REMOVED***

***REMOVED*** def create
***REMOVED***   resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
***REMOVED***   return sign_in_and_redirect(resource_name, resource)
***REMOVED*** ***REMOVED***

***REMOVED*** def sign_in_and_redirect(resource_or_scope, resource=nil)
***REMOVED***   scope = Devise::Mapping.find_scope!(resource_or_scope)
***REMOVED***   resource ||= resource_or_scope
***REMOVED***   sign_in(scope, resource) unless warden.user(scope) == resource

***REMOVED***   respond_to do |format|
***REMOVED***     format.html {
***REMOVED***       redirect_to paths_index_url
***REMOVED***     }
***REMOVED***     format.js {
***REMOVED***       r***REMOVED***er json: {
***REMOVED***         success: true,
***REMOVED***         redirect: stored_location_for(scope) || after_sign_in_path_for(resource)
***REMOVED***       }
***REMOVED***     }
***REMOVED*** ***REMOVED***
***REMOVED*** ***REMOVED***

***REMOVED*** def failure
***REMOVED***   respond_to do |format|
***REMOVED***     format.html {
***REMOVED***       flash[:alert] = 'You probably mistyped your password'
***REMOVED***       redirect_to new_user_session_url
***REMOVED***     }
***REMOVED***     format.js {
***REMOVED***       r***REMOVED***er :json => {:success => false, :errors => ["Login failed."]}
***REMOVED***     }
***REMOVED*** ***REMOVED***
***REMOVED*** ***REMOVED***
***REMOVED***
