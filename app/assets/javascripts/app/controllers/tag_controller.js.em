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

          transitionToDone = () ->
            link.set('tagged_path', path)
            self.transitionToRoute('done', link.fake_item)

          link.save().then(transitionToDone)
