class SessionsController < Devise::SessionsController
  respond_to :json
  def create
    binding.pry
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    r***REMOVED***er :status => 200,
      :json => { :success => true,
                 :info => "Logged in",
                 :user => current_user
    }
***REMOVED***

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    r***REMOVED***er :status => 200,
      :json => { :success => true,
                 :info => "Logged out",
    }
***REMOVED***

  def failure
    r***REMOVED***er :status => 401,
      :json => { :success => false,
                 :info => "Login Credentials Failed"
    }
***REMOVED***

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    r***REMOVED***er :status => 200,
      :json => { :success => true,
                 :info => "Current User",
                 :user => current_user
    }

***REMOVED***
***REMOVED***
***REMOVED*** def create
***REMOVED***   binding.pry
***REMOVED***   resource = warden.authenticate!(scope: resource_name, recall: "sessions#failure")
***REMOVED***   sign_in_and_redirect(resource_name, resource)
***REMOVED*** ***REMOVED***

***REMOVED*** def sign_in_and_redirect(resource_or_scope, resource=nil)
***REMOVED***   scope = Devise::Mapping.find_scope!(resource_or_scope)
***REMOVED***   resource ||= resource_or_scope
***REMOVED***   sign_in(scope, resource) unless warden.user(scope) == resource
***REMOVED***   return r***REMOVED***er :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
***REMOVED*** ***REMOVED***

***REMOVED*** def failure
***REMOVED***   r***REMOVED***er :json => {:success => false, :errors => ["Login failed."]}
***REMOVED*** ***REMOVED***
