Pathoscope::Application.configure do
  Gon.global.server = SERVER = ENV['SSH'] ? 'http://192.168.0.55:3000' : 'http://localhost:3000'
  config.ember.variant = :development

***REMOVED*** Settings specified here will take precedence over those in config/application.rb.

***REMOVED*** In the development environment your application's code is reloaded on
***REMOVED*** every request. This slows down response time but is perfect for development
***REMOVED*** since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

***REMOVED*** Do not eager load code on boot.
  config.eager_load = false

***REMOVED*** Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

***REMOVED*** Don't care if the mailer can't s***REMOVED***.
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

***REMOVED*** Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

***REMOVED*** Raise an error on page load if there are p***REMOVED***ing migrations
  config.active_record.migration_error = :page_load

***REMOVED*** Debug mode disables concatenation and preprocessing of assets.
***REMOVED*** This option may cause significant delays in view r***REMOVED***ering with a large
***REMOVED*** number of complex assets.
  config.assets.debug = true
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
***REMOVED***
