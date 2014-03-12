App.DoneController = Ember.ObjectController.ext***REMOVED***
  needs: ['application']

  +computed model.@each.siblings
  base_items: ->
    model = @get('model')

    @get('model.siblings').forEach (sibling) ->
        if model.id == sibling.id
          sibling.set('open', true)

    @get('model.siblings')
