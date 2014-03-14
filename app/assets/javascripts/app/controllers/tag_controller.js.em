App.TagController = Ember.ArrayController.ext***REMOVED***
  actions:
    tagAction: (item_id) ->
      store = @store
      self = this

      store.find('item', item_id).then (item) ->
        item.get('context').then (path) ->
          link = store.createRecord 'link',
            url: window.location.href,
            creation_path_id: path.get('id')
          link.get('paths').addObject(path)

          transitionToDone = (resp) ->
            item = link.get('item')
            self.transitionToRoute('world', item, item)

          link.save().then(transitionToDone)
