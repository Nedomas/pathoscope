# http://emberjs.com/guides/models/using-the-store/

PS.Website.Store = DS.Store.ext***REMOVED***
***REMOVED*** Override the default adapter with the `DS.ActiveModelAdapter` which
***REMOVED*** is built to work nicely with the ActiveModel::Serializers gem.
  adapter: DS.ActiveModelAdapter.ext***REMOVED***
    namespace: 'api/v1'
