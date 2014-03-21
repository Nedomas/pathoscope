App.Path = DS.Model.ext***REMOVED***
  title: DS.attr('string')
  color: DS.attr('string')
  users_count: DS.attr('string')
  links_count: DS.attr('string')
  item: DS.belongsTo('item')
  item_id: DS.attr('string')
  creation_user_id: DS.attr('string')
  user_paths: DS.hasMany('userPath')
  chosen: DS.attr('boolean')

  +computed item_id
  fake_item: ->
    @store.find('item', @get('item_id'))

  +computed color
  color_class: ->
    'color-' + @get('color')

  +computed title
  short_title: ->
    @get('title')

***REMOVED*** +computed session.user
***REMOVED*** chosen: ->
***REMOVED***   debugger
  ***REMOVED*** if @get('session')
# #     _this = this
# #     Ember.run ->
# #       user_paths = _this.get('session.user.user_paths')
# #
# #       debugger
# #       if _this.get('session.user')
# #         debugger
# #         @get('session.user.user_paths')
# #           paths.forEach (path) ->
# #             if user_path.get('path') == path
# #               path.set('chosen', true)
# #
# #       ***REMOVED*** Find saved paths
# #         saved_paths = paths.filter (path) ->
# #           !path.get('isNew')
# #
# #         controller.set('model', saved_paths)
