class App.ExpertiseController ext***REMOVED***s Ember.ObjectController
  before_items: Em.A()

  actions:
    hovered: (item) ->
      model = @get('model')
      before_items = model.get('content').slice(0, model.indexOf(item))
      @set('before_items', before_items)

    selectStartAction: (item) ->
      store = @store
      _this = this

      @get('model.path').then (path) ->
        link = store.createRecord 'link',
          url: item.context.url
          creation_path_id: path.get('id'),
          creation_user_id: _this.get('session.user.id')

        link.get('paths').addObject(path)

        manageTransition = (resp) ->
          _this.get('session.user').then (user) ->
            if user.get('installed')
              item = link.get('item')
              _this.transitionToRoute('world', item)
            else
              _this.transitionToRoute('install')

        link.save().then(manageTransition)
