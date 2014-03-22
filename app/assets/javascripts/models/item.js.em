App.Item = DS.Model.ext***REMOVED***
  context_id: DS.attr('string')
  context_type: DS.attr('string')
  parents: DS.hasMany('item', inverse: 'children')
  children: DS.hasMany('item', inverse: 'parents')
  siblings: DS.hasMany('item')
  paths: DS.hasMany('path')
  notes: DS.hasMany('note')
  link: DS.belongsTo('link')
  created_at: DS.attr('string')

  wasTagged: false

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
    !_pathoscope.isEmpty(@get('children').toArray())

  +computed parents.@each
  hasParents: ->
    !_pathoscope.isEmpty(@get('parents').toArray())

  +computed notes.@each
  hasNotes: ->
    !_pathoscope.isEmpty(@get('saved_notes').toArray())

  +computed notes.@each
  saved_notes: ->
    @get('notes').filter (note) ->
      !note.get('isNew')
