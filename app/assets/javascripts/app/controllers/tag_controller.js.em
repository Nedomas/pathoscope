App.TagController = Ember.ArrayController.ext***REMOVED***
  actions:
    tagAction: (item_id) ->
      store = @store
      self = this

      store.find('item', item_id).then (item) ->
        item.get('context').then (path) ->
          link = store.createRecord 'link',
            path: path,
            url: window.location.href

          transitionToDone = (params) ->
            console.log(params)
            console.log 'transitioning'
            self.transitionToRoute('done', link)

          link.save().then(transitionToDone)
