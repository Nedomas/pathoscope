App.World = DS.Model.ext***REMOVED***
  parent: DS.belongsTo('App.World', async: true, inverse: 'children')
  children: DS.hasMany('App.World', async: true, inverse: 'parent')
  item: DS.belongsTo('App.Item')

  isPath: Ember.computed.alias('item.isPath')
***REMOVED*** +computed item.@each.isPath
***REMOVED*** isPath: ->
***REMOVED***   @get('item.isPath')

***REMOVED*** +computed
***REMOVED*** hello: ->
***REMOVED***   @store.metadataFor('current_user')
  ***REMOVED*** @get('meta.current_user')

  +computed parent
  isRoot: ->
    @get('parent') == null

  +computed children
  hasChildren: ->
    !_.isEmpty(@get('children').toArray())
