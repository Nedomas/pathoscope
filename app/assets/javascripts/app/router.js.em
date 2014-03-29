PS.Bookmarklet.Router.map ->
  @route('login')

  @route('index', { path: '/' })
  @route('tag', { path: '/tag' })
  @route('installed', { path: '/installed' })

  @resource 'done', { path: '/done/:tagged_item_id' }, ->
    @resource 'world', { path: '/world/:item_id' }

PS.Bookmarklet.Router.reopen
  location: 'none'
