App.Note = DS.Model.ext***REMOVED***
  content: DS.attr('string', defaultValue: '')
  item: DS.belongsTo('item')
  user: DS.belongsTo('user')
  created_at: DS.attr('string')

  +computed created_at
  time_ago: ->
    $.timeago(@get('created_at'))
