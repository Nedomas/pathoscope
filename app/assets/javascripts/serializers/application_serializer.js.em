console.log('yoo')
App.ApplicationSerializer = DS.RESTSerializer.ext***REMOVED***
  extractMeta: (store, type, payload) ->
  ***REMOVED*** if payload && payload.meta
  ***REMOVED*** ***REMOVED*** sets the metadata for "post"
    store.metaForType(type, current_user: 'domas bit')
  ***REMOVED*** ***REMOVED*** keeps ember data from trying to parse "total" as a record
  ***REMOVED***   delete payload.meta
