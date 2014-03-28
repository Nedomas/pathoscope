PS.Standalone.TagController = PS.ArrayController.ext***REMOVED***
  actions:
    tagAction: (item_id) ->
      store = @store
      _this = this

      store.find('item', item_id).then (item) ->
        item.get('context').then (path) ->
          link = store.createRecord 'link',
            url: window.location.href,
            creation_path_id: path.get('id'),
            creation_user_id: _this.get('session.user.id')
          link.get('paths').addObject(path)

          transitionToDone = (resp) ->
            item = link.get('item')
            _this.transitionToRoute('world', item, item)

          link.save().then(transitionToDone)
