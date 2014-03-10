App.Path = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  color: DS.attr('string')
  users_count: DS.attr('string')
  links_count: DS.attr('string')
  item: DS.belongsTo('App.Item')
  child: DS.belongsTo('App.Item')
  user_paths: DS.hasMany('App.UserPath')

  +computed color
  color_class: ->
    'color-' + @get('color')