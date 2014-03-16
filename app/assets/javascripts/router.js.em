App.Router.reopen
  rootURL: '/beta'

App.Router.map ->
  @route('login')

  @resource 'paths', ->
    @route('new')

  @resource('install')

  @resource 'map', { path: '/map/:item_id' }, ->
    @route('notes')

  @resource 'world', { path: '/world/:item_id' }, ->
    @route('notes')
