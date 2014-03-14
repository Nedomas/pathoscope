App.User = DS.Model.ext***REMOVED***
  email: DS.attr('string')
  username: DS.attr('string')
  notes: DS.hasMany('note')
  paths: DS.hasMany('path')
  items: DS.hasMany('item')
  user_paths: DS.hasMany('userPath')

  +computed paths.@each, items.@each.paths
  maps: ->
    result = []
    items = @get('items')

    @get('paths').forEach (path) ->
      path_items = items.filter (item) ->
        in_path = _.contains(item.get('paths').toArray(), path)
        in_path && !item.get('isPath')

      sorted_items = Em.ArrayProxy.createWithMixins Ember.SortableMixin,
        content: path_items
        sortProperties: ['created_at']

      result.pushObject({ path: path, items: sorted_items })

    result
