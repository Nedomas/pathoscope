App.Path = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  color: DS.attr('string')
  users_count: DS.attr('string')
  links_count: DS.attr('string')
  item: DS.belongsTo('item')
  item_id: DS.attr('string')
  creation_user_id: DS.attr('string')
  user_paths: DS.hasMany('userPath')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed color
  color_class: ->
    'color-' + @get('color')

  +computed title
  short_title: ->
    @get('title')
