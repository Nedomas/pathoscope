# http://emberjs.com/guides/models/using-the-store/

App.Store = DS.Store.ext***REMOVED***
***REMOVED*** Override the default adapter with the `DS.ActiveModelAdapter` which
***REMOVED*** is built to work nicely with the ActiveModel::Serializers gem.
  adapter: DS.RESTAdapter.ext***REMOVED***
    namespace: 'api/v1'
  ***REMOVED*** serializer: App.WorldSerializer
