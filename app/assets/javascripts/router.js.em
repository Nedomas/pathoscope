# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->
  @resource('paths')
  @route('map')
  @resource('worlds')
  @resource('world', path: '/worlds/:id')

