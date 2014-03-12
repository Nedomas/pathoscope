App.User = DS.Model.ext***REMOVED***
  email: DS.attr('string')
  username: DS.attr('string')
  notes: DS.hasMany('note')
