App.Note = DS.Model.ext***REMOVED***
  content: DS.attr('string')
  item: DS.belongsTo('item')
  user: DS.belongsTo('user')

