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
          ***REMOVED*** @flashMessage('You have successfully signed out.')
            item = link.get('item')
            item.set('wasTagged', true)
            self.transitionToRoute('world', item, 1)

          link.save().then(transitionToDone)
