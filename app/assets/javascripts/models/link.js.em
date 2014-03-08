App.Link = DS.Model.ext***REMOVED***
  item: DS.belongsTo('App.Item')
  title: DS.attr('string')
  url: DS.attr('string')

  +computed title
  short_title: ->
    _.str.truncate(@get('title'), 40)

  +computed url
  short_url: ->
    host = $('<a>').prop('href', @get('url')).prop('host')
    host.replace('www.', '')
***REMOVED*** map_parent: DS.belongsTo('App.Path')
***REMOVED*** item_id: DS.attr('string')
***REMOVED*** title: DS.attr('string')
***REMOVED*** color: DS.attr('string')
***REMOVED*** users_count: DS.attr('string')
***REMOVED*** links_count: DS.attr('string')
***REMOVED*** item: DS.belongsTo('App.Item', polymorphic: true)
