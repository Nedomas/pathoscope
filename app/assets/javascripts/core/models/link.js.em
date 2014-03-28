class PS.Core.Link ext***REMOVED***s DS.Model
  title: DS.attr('string')
  url: DS.attr('string')
  paths: DS.hasMany('path')
  creation_path_id: DS.attr('string')
  creation_user_id: DS.attr('string')
  item: DS.belongsTo('item')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed url
  short_url: ->
    host = $ps('<a>').prop('href', @get('url')).prop('host')
    host.replace('www.', '')
