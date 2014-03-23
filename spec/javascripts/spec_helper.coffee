# Teaspoon includes some support files, but you can use anything from your own support path too.
# require expect
#= require sinon
#= require chai
#= require application
#= require ../../v***REMOVED***or/assets/javascripts/bower_components/ember-mocha-adapter/adapter
#= require fixtures/data
#= require_self
# require support/your-support-file

Ember.testing = true

document.write(
  '<div id="test-app-container">' +
    '<div id="ember-testing" style="width: 100%; height: 100%;">' +
    '</div>' +
  '</div>')

testing = ->
  helper = {
    container: ->
      App.__container__
    controller: (name) ->
      helper.container().lookup('controller:' + name)
    path: ->
      helper.controller('application').get('currentPath')
  }

Ember.Test.registerHelper 'path', ->
  testing().path()

App.rootElement = '#ember-testing'
Ember.Test.adapter = Ember.Test.MochaAdapter.create()
App.setupForTesting()

window.server = sinon.fakeServer.create()
server.autoRespond = true
server.xhr.useFilters = true

# server.xhr.addFilter (method, url) ->
#   debugger

window.testHelper = {
  lookup: (object, object_name) ->
    name = object_name || "main"
    App.__container__.lookup(object + ":" + name)
}

window.getParameterByName = (input, name) ->
  match = RegExp('[?&]' + name + '=([^&]*)').exec(input)
  return match && decodeURIComponent(match[1].replace(/\+/g, ' '))

Ember.Test.registerAsyncHelper 'login', ->
  Ember.run ->
    server.respondWith 'POST', '/oauth/token', (params) ->
      { access_token: 'some-token', user_id: 1 }

    visit('/login')
    fillIn('.email input', 'john@mayer.com')
    fillIn('.password input', 'testing')
    click('.sign-in button')

Ember.Test.registerAsyncHelper 'mockPathsApi', ->
  Ember.run ->
    server.respondWith 'GET', '/api/v1/paths', [
      200,
      { 'Content-Type': 'application/json' },
      JSON.stringify({
        "paths": [aerospace_path, programming_path],
        "items": [aerospace_item, programming_item, link_item],
        "user_paths": [first_user_path]
      })
  ***REMOVED***
    wait()


App.injectTestHelpers()

# PhantomJS (Teaspoons default driver) doesn't have support for Function.prototype.bind, which has caused confusion. Use
# this polyfill to avoid the confusion.
#= require support/bind-poly
#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call Teaspoon.execute()
# after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
# spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in config/initializers/teaspoon.rb
#
# Manifest
# If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# Chai
# If you're using Chai, you probably want to initialize your preferred assertion style here.
# For more information see: http://chaijs.com/guide/styles
# Examples:
#
# window.should = require('chai').should()
# mocha.ui('bdd')
mocha.globals(['Ember', 'DS', 'App', 'MD5'])
mocha.timeout(5000)
chai.config.includeStack = true
$.fx.off = true

afterEach ->
  App.reset()

# window.assert = chai.assert
window.expect = chai.expect
# window.should = chai.should()
#
# For more information: http://github.com/modeset/teaspoon
#
# You can require javascript files here. A good place to start is by requiring your application.js.
