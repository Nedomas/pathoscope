Doorkeeper.configure do
***REMOVED*** Change the ORM that doorkeeper will use.
***REMOVED*** Currently supported options are :active_record, :mongoid2, :mongoid3, :mongo_mapper
  orm :active_record

***REMOVED*** This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user || warden.authenticate!(:scope => :user)
***REMOVED***

  resource_owner_from_credentials do |routes|
    User.authenticate!(params[:username], params[:password])
***REMOVED***

***REMOVED*** If you want to restrict access to the web interface for adding oauth authorized applications, you need to declare the block below.
***REMOVED*** admin_authenticator do
***REMOVED*** ***REMOVED*** Put your admin authentication logic here.
***REMOVED*** ***REMOVED*** Example implementation:
***REMOVED***   Admin.find_by_id(session[:admin_id]) || redirect_to(new_admin_session_url)
***REMOVED*** ***REMOVED***

***REMOVED*** Authorization Code expiration time (default 10 minutes).
***REMOVED*** authorization_code_expires_in 10.minutes

***REMOVED*** Access token expiration time (default 2 hours).
***REMOVED*** If you want to disable expiration, set this to nil.
***REMOVED*** access_token_expires_in 2.hours

***REMOVED*** Issue access tokens with refresh token (disabled by default)
***REMOVED*** use_refresh_token

***REMOVED*** Provide support for an owner to be assigned to each registered application (disabled by default)
***REMOVED*** Optional parameter :confirmation => true (default false) if you want to enforce ownership of
***REMOVED*** a registered application
***REMOVED*** Note: you must also run the rails g doorkeeper:application_owner generator to provide the necessary support
***REMOVED*** enable_application_owner :confirmation => false

***REMOVED*** Define access token scopes for your provider
***REMOVED*** For more information go to https://github.com/applicake/doorkeeper/wiki/Using-Scopes
***REMOVED*** default_scopes  :public
***REMOVED*** optional_scopes :write, :update

***REMOVED*** Change the way client credentials are retrieved from the request object.
***REMOVED*** By default it retrieves first from the `HTTP_AUTHORIZATION` header, then
***REMOVED*** falls back to the `:client_id` and `:client_secret` params from the `params` object.
***REMOVED*** Check out the wiki for more information on customization
***REMOVED*** client_credentials :from_basic, :from_params

***REMOVED*** Change the way access token is authenticated from the request object.
***REMOVED*** By default it retrieves first from the `HTTP_AUTHORIZATION` header, then
***REMOVED*** falls back to the `:access_token` or `:bearer_token` params from the `params` object.
***REMOVED*** Check out the wiki for more information on customization
***REMOVED*** access_token_methods :from_bearer_authorization, :from_access_token_param, :from_bearer_param

***REMOVED*** Change the test redirect uri for client apps
***REMOVED*** When clients register with the following redirect uri, they won't be redirected to any server and the authorization code will be displayed within the provider
***REMOVED*** The value can be any string. Use nil to disable this feature. When disabled, clients must provide a valid URL
***REMOVED*** (Similar behaviour: https://developers.google.com/accounts/docs/OAuth2InstalledApp#choosingredirecturi)
***REMOVED***
***REMOVED*** test_redirect_uri 'urn:ietf:wg:oauth:2.0:oob'

***REMOVED*** Under some circumstances you might want to have applications auto-approved,
***REMOVED*** so that the user skips the authorization step.
***REMOVED*** For example if dealing with trusted a application.
***REMOVED*** skip_authorization do |resource_owner, client|
***REMOVED***   client.superapp? or resource_owner.admin?
***REMOVED*** ***REMOVED***

***REMOVED*** WWW-Authenticate Realm (default "Doorkeeper").
***REMOVED*** realm "Doorkeeper"
***REMOVED***
