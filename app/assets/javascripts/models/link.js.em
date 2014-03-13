App.Link = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  url: DS.attr('string')
  paths: DS.hasMany('path')
  creation_path_id: DS.attr('string')
***REMOVED*** paths: DS.hasMany('path')
***REMOVED*** path_ids: DS.hasMany('path')
  item: DS.belongsTo('item')
***REMOVED*** item_id: DS.attr('string')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed title
  short_title: ->
    _.str.truncate(@get('title'), 30)

  +computed url
  short_url: ->
    host = $('<a>').prop('href', @get('url')).prop('host')
    host.replace('www.', '')
