require 'rollbar/rails'
Rollbar.configure do |config|
***REMOVED*** Without configuration, Rollbar is enabled in all environments.
***REMOVED*** To disable in specific environments, set config.enabled=false.

  config.access_token = ENV['ROLLBAR_TOKEN']

***REMOVED*** Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
***REMOVED***

***REMOVED*** By default, Rollbar will try to call the `current_user` controller method
***REMOVED*** to fetch the logged-in user object, and then call that object's `id`,
***REMOVED*** `username`, and `email` methods to fetch those properties. To customize:
***REMOVED*** config.person_method = "my_current_user"
***REMOVED*** config.person_id_method = "my_id"
***REMOVED*** config.person_username_method = "my_username"
***REMOVED*** config.person_email_method = "my_email"

***REMOVED*** If you want to attach custom data to all exception and message reports,
***REMOVED*** provide a lambda like the following. It should return a hash.
***REMOVED*** config.custom_data_method = lambda { {:some_key => "some_value" } }

***REMOVED*** Add exception class names to the exception_level_filters hash to
***REMOVED*** change the level that exception is reported at. Note that if an exception
***REMOVED*** has already been reported and logged the level will need to be changed
***REMOVED*** via the rollbar interface.
***REMOVED*** Valid levels: 'critical', 'error', 'warning', 'info', 'debug', 'ignore'
***REMOVED*** 'ignore' will cause the exception to not be reported at all.
***REMOVED*** config.exception_level_filters.merge!('MyCriticalException' => 'critical')
***REMOVED***
***REMOVED*** You can also specify a callable, which will be called with the exception instance.
***REMOVED*** config.exception_level_filters.merge!('MyCriticalException' => lambda { |e| 'critical' })

***REMOVED*** Enable asynchronous reporting (uses girl_friday or Threading if girl_friday
***REMOVED*** is not installed)
***REMOVED*** config.use_async = true
***REMOVED*** Supply your own async handler:
***REMOVED*** config.async_handler = Proc.new { |payload|
***REMOVED***  Thread.new { Rollbar.process_payload(payload) }
***REMOVED*** }

***REMOVED*** Enable asynchronous reporting (using sucker_punch)
***REMOVED*** config.use_sucker_punch

***REMOVED*** Enable delayed reporting (using Sidekiq)
***REMOVED*** config.use_sidekiq
***REMOVED*** You can supply custom Sidekiq options:
***REMOVED*** config.use_sidekiq 'queue' => 'my_queue'
***REMOVED***
