App.User = DS.Model.ext***REMOVED***
  email: DS.attr('string')
  username: DS.attr('string')
  notes: DS.hasMany('note')
  paths: DS.hasMany('path')
  items: DS.hasMany('item')

  +computed paths.@each, items.@each.paths
  maps: ->
    result = []
    items = @get('items')

    @get('paths').forEach (path) ->
      path_items = items.filter (item) ->
        in_path = _.contains(item.get('paths').toArray(), path)
        in_path && !item.get('isPath')

      result.pushObject({ path: path, items: path_items })

    result
