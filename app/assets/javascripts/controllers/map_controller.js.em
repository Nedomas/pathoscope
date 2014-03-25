class App.MapController ext***REMOVED***s Ember.ObjectController with Tree
  actions:
    childrenAction: (item_id) ->
      _this = this

      @store.find('item', item_id).then (item) ->
        item.get('context').then (path) ->
          user_path = _this.get('user.user_paths').findBy('path', path)

          if _this.get('model.id') == user_path.id
            _this.toggleProperty('childrenExpanded')
          else
            _this.set('childrenExpanded', true)
            _this.transitionToRoute(_this.get('route'), user_path.id)
          false
