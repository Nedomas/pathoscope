# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'webmock/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for p***REMOVED***ing migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_p***REMOVED***ing! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
***REMOVED*** ## Mock Framework
***REMOVED***
***REMOVED*** If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
***REMOVED***
***REMOVED*** config.mock_with :mocha
***REMOVED*** config.mock_with :flexmock
***REMOVED*** config.mock_with :rr

***REMOVED*** Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

***REMOVED*** If you're not using ActiveRecord, or you'd prefer not to run each of your
***REMOVED*** examples within a transaction, remove the following line or assign false
***REMOVED*** instead of true.
  config.use_transactional_fixtures = true

***REMOVED*** If true, the base class of anonymous controllers will be inferred
***REMOVED*** automatically. This will be the default behavior in future versions of
***REMOVED*** rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

***REMOVED*** Run specs in random order to surface order dep***REMOVED***encies. If you find an
***REMOVED*** order dep***REMOVED***ency and want to debug it, you can fix the order by providing
***REMOVED*** the seed, which is printed after each run.
***REMOVED***     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
***REMOVED***

  config.before(:each) do
    DatabaseCleaner.start
***REMOVED***

  config.after(:each) do
    DatabaseCleaner.clean
***REMOVED***

***REMOVED***
