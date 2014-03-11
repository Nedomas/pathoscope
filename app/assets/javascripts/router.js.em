# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->
  @resource('paths')
  @route('map')
***REMOVED*** @route('worlds')
***REMOVED*** @resource('world')
  @resource('world', path: '/world/:id')

# DS.RESTAdapter.map 'item',
#   item: { embedded: 'always' }
