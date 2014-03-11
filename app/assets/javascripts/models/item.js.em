App.Item = DS.Model.ext***REMOVED***
  context_id: DS.attr('string')
  context_type: DS.attr('string')
  children: DS.hasMany('item')
  parents: DS.hasMany('item')
***REMOVED*** map_parents: DS.hasMany('App.Path')

***REMOVED*** +computed context_id, context_type
***REMOVED*** context: ->
***REMOVED***   if @get('context_type') == 'Path'
***REMOVED***     App.Path.find(@get('context_id'))
***REMOVED***   else
***REMOVED***     App.Link.find(@get('context_id'))

***REMOVED*** +computed context_type
***REMOVED*** isPath: ->
***REMOVED***   @get('context_type') == 'Path'

***REMOVED*** +computed children
***REMOVED*** hasChildren: ->
***REMOVED***   !_.isEmpty(@get('children').toArray())

***REMOVED*** +computed parents
***REMOVED*** hasParents: ->
***REMOVED***   !_.isEmpty(@get('parents').toArray())

***REMOVED*** recalcing itself when parent is observed
  +computed parents
  siblings: ->
    parents = @get('parents')
    has_parents = @get('hasParents')

    debugger
    []
  ***REMOVED*** @store.filter App.Item, {}, (item) ->
  ***REMOVED***   contains_every = item.get('parents').every (parent) ->
  ***REMOVED***     parents.contains(parent)

  ***REMOVED***   contains_every && (item.get('hasParents') == has_parents)
