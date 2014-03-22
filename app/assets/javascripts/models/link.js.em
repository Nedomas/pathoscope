App.Link = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  url: DS.attr('string')
  paths: DS.hasMany('path')
  creation_path_id: DS.attr('string')
  item: DS.belongsTo('item')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed title
  short_title: ->
    _pathoscope.str.truncate(@get('title'), 30)

  +computed url
  short_url: ->
    host = $('<a>').prop('href', @get('url')).prop('host')
    host.replace('www.', '')
