# This file allows you to override various Teaspoon configuration directives when running from the command line. It is not
# required from within the Rails environment, so overriding directives that have been defined within the initializer
# is not possible.
#
# Set RAILS_ROOT and load the environment.
ENV["RAILS_ROOT"] = File.expand_path("../../", __FILE__)
require File.expand_path("../../config/environment", __FILE__)

# Provide default configuration.
#
# You can override various configuration directives defined here by using arguments with the teaspoon command.
#
# teaspoon --driver=selenium --suppress-log
# rake teaspoon DRIVER=selenium SUPPRESS_LOG=false
Teaspoon.setup do |config|
***REMOVED*** Driver / Server
***REMOVED***config.driver              = "phantomjs" # available: phantomjs, selenium
***REMOVED***config.server              = nil # defaults to Rack::Server

***REMOVED*** Behaviors
***REMOVED***config.server_timeout      = 20 # timeout for starting the server
***REMOVED***config.server_port         = nil # defaults to any open port unless specified
***REMOVED***config.fail_fast           = true # abort after the first failing suite

***REMOVED*** Output
***REMOVED***config.formatters          = "dot" # available: dot, tap, tap_y, swayze_or_oprah
***REMOVED***config.suppress_log        = false # suppress logs coming from console[log/error/debug]
***REMOVED***config.color               = true

***REMOVED*** Coverage (requires istanbul -- https://github.com/gotwarlost/istanbul)
***REMOVED***config.coverage                      = true
***REMOVED***config.coverage_reports              = "text,html,cobertura"
***REMOVED***config.coverage_output_dir           = "coverage"
***REMOVED***config.statements_coverage_threshold = 50
***REMOVED***config.functions_coverage_threshold  = 50
***REMOVED***config.branches_coverage_threshold   = 50
***REMOVED***config.lines_coverage_threshold      = 50
***REMOVED***
