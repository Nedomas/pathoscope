# App.ApplicationSerializer = DS.RESTSerializer.ext***REMOVED***
#   extractMeta: (loader, type, json) ->
#     console.log('Extracting')
#     meta = json[@configOption(type, 'meta')]
#     if !meta
#       return
#     Ember.set('App.metaData', meta)
#     @_super(loader, type, json)
#
# console.log('Serializer included')
#
# App.PathSerializer = DS.RESTSerializer.ext***REMOVED***
#   extractArray: (store, type, payload, requestType) ->
#     console.log('yp')
#     debugger
#



  ***REMOVED*** if payload && payload.meta
  ***REMOVED*** ***REMOVED*** sets the metadata for "post"
  ***REMOVED***   store.metaForType(App.CurrentUser, payload.meta)
  ***REMOVED*** ***REMOVED*** keeps ember data from trying to parse "total" as a record
  ***REMOVED***   delete payload.meta
