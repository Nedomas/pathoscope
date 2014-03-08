App.MapRoute = Ember.Route.ext***REMOVED***
  model: ->
  ***REMOVED*** console.log('yooo')
  ***REMOVED*** @store.find('user_path')
  ***REMOVED*** # App.UserPath.find()
    Ember.RSVP.hash
      paths: @store.find('path')
      items: @store.find('item')
      user_paths: @store.find('user_path')
      users: @store.find('user')
