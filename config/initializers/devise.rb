# Dir["lib/*.rb"].each {|file| load file }
# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
***REMOVED*** The secret key used by Devise. Devise uses this key to generate
***REMOVED*** random tokens. Changing this key will r***REMOVED***er invalid all existing
***REMOVED*** confirmation, reset password and unlock tokens in the database.
  config.secret_key = ENV['DEVISE_SECRET']

***REMOVED*** ==> Mailer Configuration
***REMOVED*** Configure the e-mail address which will be shown in Devise::Mailer,
***REMOVED*** note that it will be overwritten if you use your own mailer class
***REMOVED*** with default "from" parameter.
  config.mailer_s***REMOVED***er = 'please-change-me-at-config-initializers-devise@example.com'

***REMOVED*** Configure the class responsible to s***REMOVED*** e-mails.
***REMOVED*** config.mailer = 'Devise::Mailer'

***REMOVED*** ==> ORM configuration
***REMOVED*** Load and configure the ORM. Supports :active_record (default) and
***REMOVED*** :mongoid (bson_ext recomm***REMOVED***ed) by default. Other ORMs may be
***REMOVED*** available as additional gems.
  require 'devise/orm/active_record'

***REMOVED*** ==> Configuration for any authentication mechanism
***REMOVED*** Configure which keys are used when authenticating a user. The default is
***REMOVED*** just :email. You can configure it to use [:username, :subdomain], so for
***REMOVED*** authenticating a user, both parameters are required. Remember that those
***REMOVED*** parameters are used only when authenticating and not when retrieving from
***REMOVED*** session. If you need permissions, you should implement that in a before filter.
***REMOVED*** You can also supply a hash where the value is a boolean determining whether
***REMOVED*** or not authentication should be aborted when the value is not present.
***REMOVED*** config.authentication_keys = [ :email ]

***REMOVED*** Configure parameters from the request object used for authentication. Each entry
***REMOVED*** given should be a request method and it will automatically be passed to the
***REMOVED*** find_for_authentication method and considered in your model lookup. For instance,
***REMOVED*** if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
***REMOVED*** The same considerations mentioned for authentication_keys also apply to request_keys.
***REMOVED*** config.request_keys = []

***REMOVED*** Configure which authentication keys should be case-insensitive.
***REMOVED*** These keys will be downcased upon creating or modifying a user and when used
***REMOVED*** to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [ :email ]

***REMOVED*** Configure which authentication keys should have whitespace stripped.
***REMOVED*** These keys will have whitespace before and after removed upon creating or
***REMOVED*** modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [ :email ]

***REMOVED*** Tell if authentication through request.params is enabled. True by default.
***REMOVED*** It can be set to an array that will enable params authentication only for the
***REMOVED*** given strategies, for example, `config.params_authenticatable = [:database]` will
***REMOVED*** enable it only for database (email + password) authentication.
***REMOVED*** config.params_authenticatable = true

***REMOVED*** Tell if authentication through HTTP Auth is enabled. False by default.
***REMOVED*** It can be set to an array that will enable http authentication only for the
***REMOVED*** given strategies, for example, `config.http_authenticatable = [:database]` will
***REMOVED*** enable it only for database authentication. The supported strategies are:
***REMOVED*** :database      = Support basic authentication with authentication key + password
***REMOVED*** config.http_authenticatable = false

***REMOVED*** If http headers should be returned for AJAX requests. True by default.
  config.http_authenticatable_on_xhr = false

***REMOVED*** The realm used in Http Basic Authentication. 'Application' by default.
***REMOVED*** config.http_authentication_realm = 'Application'

***REMOVED*** It will change confirmation, password recovery and other workflows
***REMOVED*** to behave the same regardless if the e-mail provided was right or wrong.
***REMOVED*** Does not affect registerable.
***REMOVED*** config.paranoid = true

***REMOVED*** By default Devise will store the user in session. You can skip storage for
***REMOVED*** particular strategies by setting this option.
***REMOVED*** Notice that if you are skipping storage for all authentication paths, you
***REMOVED*** may want to disable generating routes to Devise's sessions controller by
***REMOVED*** passing :skip => :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

***REMOVED*** By default, Devise cleans up the CSRF token on authentication to
***REMOVED*** avoid CSRF token fixation attacks. This means that, when using AJAX
***REMOVED*** requests for sign in and sign up, you need to get a new CSRF token
***REMOVED*** from the server. You can disable this option at your own risk.
***REMOVED*** config.clean_up_csrf_token_on_authentication = true

***REMOVED*** ==> Configuration for :database_authenticatable
***REMOVED*** For bcrypt, this is the cost for hashing the password and defaults to 10. If
***REMOVED*** using other encryptors, it sets how many times you want the password re-encrypted.
***REMOVED***
***REMOVED*** Limiting the stretches to just one in testing will increase the performance of
***REMOVED*** your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
***REMOVED*** a value less than 10 in other environments.
  config.stretches = Rails.env.test? ? 1 : 10

***REMOVED*** Setup a pepper to generate the encrypted password.
***REMOVED*** config.pepper = '0fca3309094d61d29759e1c0ac8ef09f63153a5e4fd3dc78c3afd9c72d01807fe2e3de13dc74ee00cf4acf88ef69da6f797c515e99e33eaa576bfa591de4c965'

***REMOVED*** ==> Configuration for :confirmable
***REMOVED*** A period that the user is allowed to access the website even without
***REMOVED*** confirming his account. For instance, if set to 2.days, the user will be
***REMOVED*** able to access the website for two days without confirming his account,
***REMOVED*** access will be blocked just in the third day. Default is 0.days, meaning
***REMOVED*** the user cannot access the website without confirming his account.
***REMOVED*** config.allow_unconfirmed_access_for = 2.days

***REMOVED*** A period that the user is allowed to confirm their account before their
***REMOVED*** token becomes invalid. For example, if set to 3.days, the user can confirm
***REMOVED*** their account within 3 days after the mail was sent, but on the fourth day
***REMOVED*** their account can't be confirmed with the token any more.
***REMOVED*** Default is nil, meaning there is no restriction on how long a user can take
***REMOVED*** before confirming their account.
***REMOVED*** config.confirm_within = 3.days

***REMOVED*** If true, requires any email changes to be confirmed (exactly the same way as
***REMOVED*** initial account confirmation) to be applied. Requires additional unconfirmed_email
***REMOVED*** db field (see migrations). Until confirmed new email is stored in
***REMOVED*** unconfirmed email column, and copied to email column on successful confirmation.
  config.reconfirmable = true

***REMOVED*** Defines which key will be used when confirming an account
***REMOVED*** config.confirmation_keys = [ :email ]

***REMOVED*** ==> Configuration for :rememberable
***REMOVED*** The time the user will be remembered without asking for credentials again.
***REMOVED*** config.remember_for = 2.weeks

***REMOVED*** If true, ext***REMOVED***s the user's remember period when remembered via cookie.
***REMOVED*** config.ext***REMOVED***_remember_period = false

***REMOVED*** Options to be passed to the created cookie. For instance, you can set
***REMOVED*** :secure => true in order to force SSL only cookies.
***REMOVED*** config.rememberable_options = {}

***REMOVED*** ==> Configuration for :validatable
***REMOVED*** Range for password length. Default is 8..128.
  config.password_length = 8..128

***REMOVED*** Email regex used to validate email formats. It simply asserts that
***REMOVED*** one (and only one) @ exists in the given string. This is mainly
***REMOVED*** to give user feedback and not to assert the e-mail validity.
***REMOVED*** config.email_regexp = /\A[^@]+@[^@]+\z/

***REMOVED*** ==> Configuration for :timeoutable
***REMOVED*** The time you want to timeout the user session without activity. After this
***REMOVED*** time the user will be asked for credentials again. Default is 30 minutes.
***REMOVED*** config.timeout_in = 30.minutes

***REMOVED*** If true, expires auth token on session timeout.
***REMOVED*** config.expire_auth_token_on_timeout = false

***REMOVED*** ==> Configuration for :lockable
***REMOVED*** Defines which strategy will be used to lock an account.
***REMOVED*** :failed_attempts = Locks an account after a number of failed attempts to sign in.
***REMOVED*** :none            = No lock strategy. You should handle locking by yourself.
***REMOVED*** config.lock_strategy = :failed_attempts

***REMOVED*** Defines which key will be used when locking and unlocking an account
***REMOVED*** config.unlock_keys = [ :email ]

***REMOVED*** Defines which strategy will be used to unlock an account.
***REMOVED*** :email = S***REMOVED***s an unlock link to the user email
***REMOVED*** :time  = Re-enables login after a certain amount of time (see :unlock_in below)
***REMOVED*** :both  = Enables both strategies
***REMOVED*** :none  = No unlock strategy. You should handle unlocking by yourself.
***REMOVED*** config.unlock_strategy = :both

***REMOVED*** Number of authentication tries before locking an account if lock_strategy
***REMOVED*** is failed attempts.
***REMOVED*** config.maximum_attempts = 20

***REMOVED*** Time interval to unlock the account if :time is enabled as unlock_strategy.
***REMOVED*** config.unlock_in = 1.hour

***REMOVED*** Warn on the last attempt before the account is locked.
***REMOVED*** config.last_attempt_warning = false

***REMOVED*** ==> Configuration for :recoverable
***REMOVED***
***REMOVED*** Defines which key will be used when recovering the password for an account
***REMOVED*** config.reset_password_keys = [ :email ]

***REMOVED*** Time interval you can reset your password with a reset password key.
***REMOVED*** Don't put a too small interval or your users won't have the time to
***REMOVED*** change their passwords.
  config.reset_password_within = 6.hours

***REMOVED*** ==> Configuration for :encryptable
***REMOVED*** Allow you to use another encryption algorithm besides bcrypt (default). You can use
***REMOVED*** :sha1, :sha512 or encryptors from others authentication tools as :clearance_sha1,
***REMOVED*** :authlogic_sha512 (then you should set stretches above to 20 for default behavior)
***REMOVED*** and :restful_authentication_sha1 (then you should set stretches to 10, and copy
***REMOVED*** REST_AUTH_SITE_KEY to pepper).
***REMOVED***
***REMOVED*** Require the `devise-encryptable` gem when using anything other than bcrypt
***REMOVED*** config.encryptor = :sha512

***REMOVED*** ==> Scopes configuration
***REMOVED*** Turn scoped views on. Before r***REMOVED***ering "sessions/new", it will first check for
***REMOVED*** "users/sessions/new". It's turned off by default because it's slower if you
***REMOVED*** are using only default views.
***REMOVED*** config.scoped_views = false

***REMOVED*** Configure the default scope given to Warden. By default it's the first
***REMOVED*** devise role declared in your routes (usually :user).
***REMOVED*** config.default_scope = :user

***REMOVED*** Set this configuration to false if you want /users/sign_out to sign out
***REMOVED*** only the current scope. By default, Devise signs out all scopes.
***REMOVED*** config.sign_out_all_scopes = true

***REMOVED*** ==> Navigation configuration
***REMOVED*** Lists the formats that should be treated as navigational. Formats like
***REMOVED*** :html, should redirect to the sign in page when the user does not have
***REMOVED*** access, but formats like :xml or :json, should return 401.
***REMOVED***
***REMOVED*** If you have any extra navigational formats, like :iphone or :mobile, you
***REMOVED*** should add them to the navigational formats lists.
***REMOVED***
***REMOVED*** The "*/*" below is required to match Internet Explorer requests.
  config.navigational_formats = [:html, :json]

***REMOVED*** The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

***REMOVED*** ==> OmniAuth
***REMOVED*** Add a new OmniAuth provider. Check the wiki for more information on setting
***REMOVED*** up on your models and hooks.
***REMOVED*** config.omniauth :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'

***REMOVED*** ==> Warden configuration
***REMOVED*** If you want to use other strategies, that are not supported by Devise, or
***REMOVED*** change the failure app, you can configure them inside the config.warden block.
***REMOVED***

***REMOVED*** config.warden do |manager|
***REMOVED***   manager.failure_app = CustomFailure
***REMOVED*** ***REMOVED***
***REMOVED*** config.warden do |manager|
***REMOVED***   manager.intercept_401 = false
***REMOVED***   manager.default_strategies(:scope => :user).unshift :some_external_strategy
***REMOVED*** ***REMOVED***

***REMOVED*** ==> Mountable engine configurations
***REMOVED*** When using Devise inside an engine, let's call it `MyEngine`, and this engine
***REMOVED*** is mountable, there are some extra configurations to be taken into account.
***REMOVED*** The following options are available, assuming the engine is mounted as:
***REMOVED***
***REMOVED***     mount MyEngine, at: '/my_engine'
***REMOVED***
***REMOVED*** The router that invoked `devise_for`, in the example above, would be:
***REMOVED*** config.router_name = :my_engine
***REMOVED***
***REMOVED*** When using omniauth, Devise cannot automatically set Omniauth path,
***REMOVED*** so you need to do it manually. For the users scope, it would be:
***REMOVED*** config.omniauth_path_prefix = '/my_engine/users/auth'
***REMOVED***
