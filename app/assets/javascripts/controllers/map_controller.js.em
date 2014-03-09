App.MapController = Ember.ArrayController.ext***REMOVED***
  +computed parent
  paths_as_maps: ->
    @store.filter App.Map, {}, (map) ->
      map.get('isRoot')
