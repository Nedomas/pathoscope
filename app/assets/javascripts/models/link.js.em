App.Link = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  item: DS.belongsTo('App.Item')
***REMOVED*** item_id: DS.attr('string')
***REMOVED*** title: DS.attr('string')
***REMOVED*** color: DS.attr('string')
***REMOVED*** users_count: DS.attr('string')
***REMOVED*** links_count: DS.attr('string')
***REMOVED*** item: DS.belongsTo('App.Item', polymorphic: true)
