App.Map = DS.Model.ext***REMOVED***
  parent: DS.belongsTo('map', async: true, inverse: 'children')
  children: DS.hasMany('map', async: true, inverse: 'parent')
  item: DS.belongsTo('map', async: true, inverse: 'parent')

  +computed parent
  isRoot: ->
    @get('parent') == null

  +computed children
  hasChildren: ->
    !_pathoscope.isEmpty(@get('children'))
