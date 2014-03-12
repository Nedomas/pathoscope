App.Item = DS.Model.ext***REMOVED***
  context_id: DS.attr('string')
  context_type: DS.attr('string')
  parents: DS.hasMany('item', inverse: 'children')
  children: DS.hasMany('item', inverse: 'parents')
  paths: DS.hasMany('path')
  notes: DS.hasMany('note')

  +computed context_id, context_type
  context: ->
    if @get('context_type') == 'Path'
      @store.find('path', @get('context_id'))
    else
      @store.find('link', @get('context_id'))

  +computed context_type
  isPath: ->
    @get('context_type') == 'Path'

  +computed children.@each
  hasChildren: ->
    !_.isEmpty(@get('children').toArray())

  +computed parents.@each
  hasParents: ->
    !_.isEmpty(@get('parents').toArray())

  +computed notes.@each
  hasNotes: ->
    !_.isEmpty(@get('saved_notes').toArray())

  +computed notes.@each
  saved_notes: ->
    @get('notes').filter (note) ->
      !note.get('isNew')

***REMOVED*** recalcing itself when parent is observed
  +computed
  siblings: ->
    self = this
    parents = @get('parents')
    has_parents = @get('hasParents')

    @store.filter 'item', {}, (item) ->
      contains_every = item.get('parents').every (parent) ->
        parents.contains(parent)
      parents_equal = item.get('hasParents') == has_parents

      contains_every && parents_equal && item != self
