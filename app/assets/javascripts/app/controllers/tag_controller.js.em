App.TagController = Ember.ArrayController.ext***REMOVED***
  actions:
    tagAction: (item_id) ->
      store = @store
      self = this

      store.find('item', item_id).then (item) ->
        item.get('context').then (path) ->
          link = store.createRecord 'link',
            url: window.location.href
          link.get('paths').addObject(path)


          transitionToDone = (resp) ->
            link.set('tagged_path', path)
            self.transitionToRoute('done.index', link.get('item_id'))

          link.save().then(transitionToDone)
