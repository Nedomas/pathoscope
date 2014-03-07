App.MapRoute = Ember.Route.ext***REMOVED***
  model: ->
    Ember.RSVP.hash
      paths: @store.find('path')
      items: @store.find('item')
      map: ->
        $.get('/api/v1/map').then (resp) ->
          console.log 'done'
          debugger
