App.Router.reopen
  rootURL: '/beta'

App.Router.map ->
  @route('login')

  @resource 'paths', ->
    @route('new')

  @resource('install')

  @resource 'map', { path: '/map/:user_path_id' }, ->
    @route('notes')

  @resource 'world', { path: '/world/:item_id' }, ->
    @route('notes')

  @resource 'expertise', { path: '/expertise/:path_id' }
