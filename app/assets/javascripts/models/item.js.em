App.Item = DS.Model.ext***REMOVED***
  context_id: DS.attr('string')
  context_type: DS.attr('string')
  children: DS.hasMany('App.Item')
  parents: DS.hasMany('App.Item')
***REMOVED*** map_parents: DS.hasMany('App.Path')

  +computed context_id, context_type
  context: ->
    if @get('context_type') == 'Path'
      App.Path.find(@get('context_id'))
    else
      App.Link.find(@get('context_id'))

  +computed context_type
  isPath: ->
    @get('context_type') == 'Path'

  +computed children
  hasChildren: ->
    !_.isEmpty(@get('children').toArray())

  +computed parents
  hasParents: ->
    !_.isEmpty(@get('parents').toArray())

***REMOVED*** recalcing itself when parent is observed
  +computed parents
  siblings: ->
    parents = @get('parents')
    has_parents = @get('hasParents')

    @store.filter App.Item, {}, (item) ->
      contains_every = item.get('parents').every (parent) ->
        parents.contains(parent)

      contains_every && (item.get('hasParents') == has_parents)
