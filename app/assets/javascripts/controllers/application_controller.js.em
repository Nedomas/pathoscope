App.ApplicationController = Ember.Controller.ext***REMOVED***

  +computed
  current_user: ->
    @get('currentSession.user')
  ***REMOVED*** @store.get('currentSession')
  ***REMOVED*** @store.set('current_user', currentSession)

***REMOVED*** +computed App.metaData.current_user
***REMOVED*** domas: ->
***REMOVED***   @store.get('meta')
  ***REMOVED*** 'helllo' + Ember.get('App.metaData')
  ***REMOVED*** 'hello'

