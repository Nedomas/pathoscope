App.Link = DS.Model.ext***REMOVED***
  item: DS.belongsTo('item')
  title: DS.attr('string')
  url: DS.attr('string')
  paths: DS.hasMany('path')
  item_id: DS.attr('string')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed title
  short_title: ->
    _.str.truncate(@get('title'), 40)

  +computed url
  short_url: ->
    host = $('<a>').prop('href', @get('url')).prop('host')
    host.replace('www.', '')
