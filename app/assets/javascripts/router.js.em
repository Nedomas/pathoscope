# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->
  @resource('paths')
  @route('map')
***REMOVED*** @route('worlds')
  @route('world')
  @resource('world', path: '/world/:id')

