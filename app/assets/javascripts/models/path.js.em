App.Path = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  color: DS.attr('string')
  users_count: DS.attr('string')
  links_count: DS.attr('string')
  item: DS.belongsTo('item')
  item_id: DS.attr('string')
***REMOVED*** child: DS.belongsTo('item')
***REMOVED*** user_paths: DS.hasMany('App.UserPath')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed color
  color_class: ->
    'color-' + @get('color')
