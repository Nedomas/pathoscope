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
