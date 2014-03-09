App.MapRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.find('map')
  ***REMOVED*** Ember.RSVP.hash
  ***REMOVED***   paths: @store.find('path')
  ***REMOVED***   items: @store.find('item')
  ***REMOVED***   user_paths: @store.find('user_path')
  ***REMOVED***   users: @store.find('user')
