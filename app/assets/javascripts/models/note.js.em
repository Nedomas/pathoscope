App.Note = DS.Model.ext***REMOVED***
  content: DS.attr('string', defaultValue: '')
  item: DS.belongsTo('item')
  user: DS.belongsTo('user')

