# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource('paths')
  @route('map')

***REMOVED*** @resource('worlds')
  @resource 'world', { path: '/world/:item_id' }, ->
    @route('notes')
