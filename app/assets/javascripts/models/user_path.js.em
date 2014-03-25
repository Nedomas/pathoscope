class App.UserPath ext***REMOVED***s DS.Model
  path: DS.belongsTo('path')
  user: DS.belongsTo('user')
  items: DS.hasMany('item')
  siblings: DS.hasMany('user_path')
