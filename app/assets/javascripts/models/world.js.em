# App.World = DS.Model.ext***REMOVED***
#   parent: DS.belongsTo('App.World', async: true, inverse: 'children')
#   children: DS.hasMany('App.World', async: true, inverse: 'parent')
#   item: DS.belongsTo('App.Item')
#
#   isPath: Ember.computed.alias('item.isPath')
#
#   +computed parent
#   isRoot: ->
#     @get('parent') == null
#
#   +computed children
#   hasChildren: ->
#     !_.isEmpty(@get('children').toArray())
#
#   +computed parent
#   hasParent: ->
#     @get('parent') != null
#
# ***REMOVED*** recalcing itself when parent is observed
#   +computed children
#   siblings: ->
#     parent = @get('parent')
#     @store.filter App.World, {}, (world) ->
#       world.get('parent') == parent
