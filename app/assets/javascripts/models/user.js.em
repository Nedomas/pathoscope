App.User = DS.Model.ext***REMOVED***
  email: DS.attr('string')
  username: DS.attr('string')
  user_paths: DS.hasMany('App.UserPath')
