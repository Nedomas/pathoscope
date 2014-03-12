App.UserPath = DS.Model.ext***REMOVED***
  path: DS.belongsTo('path')
  user: DS.belongsTo('user')
***REMOVED*** items: DS.hasMany('App.Item')
