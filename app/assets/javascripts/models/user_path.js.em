App.UserPath = DS.Model.ext***REMOVED***
  path: DS.belongsTo('path')
  user: DS.belongsTo('user')
  items: DS.hasMany('item')

  +computed user.user_paths.@each
  siblings: ->
    _this = this
    @get('user.user_paths').filter (user_path) ->
      user_path != _this
