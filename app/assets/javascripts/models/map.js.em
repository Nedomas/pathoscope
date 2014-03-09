App.Map = DS.Model.ext***REMOVED***
  parent: DS.belongsTo('App.Map', async: true, inverse: 'children')
  children: DS.hasMany('App.Map', async: true, inverse: 'parent')
  item: DS.belongsTo('App.Item', async: true, inverse: 'parent')

  +computed parent
  isRoot: ->
    @get('parent') == null

  +computed children
  hasChildren: ->
    !_.isEmpty(@get('children'))
