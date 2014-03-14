App.UserPath = DS.Model.ext***REMOVED***
  path: DS.belongsTo('path')
  user: DS.belongsTo('user')
  items: DS.hasMany('item')
