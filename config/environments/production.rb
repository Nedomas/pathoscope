Pathoscope::Application.configure do
  Gon.global.server = SERVER = ENV['SERVER']
  config.ember.variant = :production
  ROLLBAR_ACCESS_TOKEN = ENV['ROLLBAR_TOKEN']

  ENV['ROLLBAR_ACCESS_TOKEN'] = ROLLBAR_ACCESS_TOKEN

***REMOVED*** Settings specified here will take precedence over those in config/application.rb.

***REMOVED*** Code is not reloaded between requests.
  config.cache_classes = true

***REMOVED*** Eager load code on boot. This eager loads most of Rails and
***REMOVED*** your application in memory, allowing both thread web servers
***REMOVED*** and those relying on copy on write to perform better.
***REMOVED*** Rake tasks automatically ignore this option for performance.
  config.eager_load = true

***REMOVED*** Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "pathoscope.mailgun.org",
    :user_name => ENV['MAIL_USERNAME'],
    :password => ENV['MAIL_PASSWORD']
  }

***REMOVED*** Enable Rack::Cache to put a simple HTTP cache in front of your application
***REMOVED*** Add `rack-cache` to your Gemfile before enabling this.
***REMOVED*** For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
***REMOVED*** config.action_dispatch.rack_cache = true

***REMOVED*** Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = true

***REMOVED*** Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
***REMOVED*** config.assets.css_compressor = :sass

***REMOVED*** Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

***REMOVED*** Generate digests for assets URLs.
  config.assets.digest = true

***REMOVED*** Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

***REMOVED*** Specifies the header that your server uses for s***REMOVED***ing files.
***REMOVED*** config.action_dispatch.x_s***REMOVED***file_header = "X-S***REMOVED***file" # for apache
***REMOVED*** config.action_dispatch.x_s***REMOVED***file_header = 'X-Accel-Redirect' # for nginx

***REMOVED*** Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
***REMOVED*** config.force_ssl = true

***REMOVED*** Set to :debug to see everything in the log.
  config.log_level = :debug

***REMOVED*** Prep***REMOVED*** all log lines with the following tags.
***REMOVED*** config.log_tags = [ :subdomain, :uuid ]

***REMOVED*** Use a different logger for distributed setups.
***REMOVED*** config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

***REMOVED*** Use a different cache store in production.
***REMOVED*** config.cache_store = :mem_cache_store

***REMOVED*** Enable serving of images, stylesheets, and JavaScripts from an asset server.
***REMOVED*** config.action_controller.asset_host = "http://assets.example.com"

***REMOVED*** Precompile additional assets.
***REMOVED*** application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
***REMOVED*** config.assets.precompile += %w( search.js )

***REMOVED*** Ignore bad email addresses and do not raise email delivery errors.
***REMOVED*** Set this to true and configure the email server for immediate delivery to raise delivery errors.
***REMOVED*** config.action_mailer.raise_delivery_errors = false

***REMOVED*** Enable locale fallbacks for I18n (makes lookups for any locale fall back to
***REMOVED*** the I18n.default_locale when a translation can not be found).
  config.i18n.fallbacks = true

***REMOVED*** S***REMOVED*** deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

***REMOVED*** Disable automatic flushing of the log to improve performance.
***REMOVED*** config.autoflush_log = false

***REMOVED*** Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new
  config.action_mailer.default_url_options = { host: 'pathoscope.com' }
***REMOVED***
