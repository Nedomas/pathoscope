App.IndexRoute = Ember.Route.ext***REMOVED***
  skipsAuthentification: true

  beforeModel: ->
    @transitionTo('paths')
