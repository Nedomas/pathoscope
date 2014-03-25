App.User = DS.Model.ext***REMOVED***
  email: DS.attr('string')
  username: DS.attr('string')
  notes: DS.hasMany('note')
  paths: DS.hasMany('path')
  items: DS.hasMany('item')
  user_paths: DS.hasMany('userPath')

  +computed user_paths.@each
  first_user_path_id: ->
    @get('user_paths.firstObject.id')
