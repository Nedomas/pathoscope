App.Item = DS.Model.ext***REMOVED***
  context_id: DS.attr('string')
  context_type: DS.attr('string')
  map_parents: DS.hasMany('App.Path')

  +computed context_id, context_type
  context: ->
    if @get('context_type') == 'Path'
      App.Path.find(@get('context_id'))
    else
      App.Link.find(@get('context_id'))
