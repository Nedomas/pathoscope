namespace :worker do
  require_relative '../../app/models/worker'

  methods = Worker.methods(false)

  methods.each do |method|
    desc method.to_s.humanize
    task method => :environment do
      Worker.s***REMOVED***(method)
***REMOVED***
***REMOVED***


***REMOVED***
