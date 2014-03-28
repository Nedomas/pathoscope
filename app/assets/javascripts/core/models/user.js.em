class PS.Core.User ext***REMOVED***s DS.Model
  email: DS.attr('string')
  username: DS.attr('string')
  password: DS.attr('string')
  passwordConfirmation: DS.attr('string')
  notes: DS.hasMany('note')
  paths: DS.hasMany('path')
  items: DS.hasMany('item')
  user_paths: DS.hasMany('userPath')
  installed: DS.attr('boolean')
  last_item_id: DS.attr('string')

  +computed user_paths.@each
  first_user_path_id: ->
    @get('user_paths.firstObject.id')
