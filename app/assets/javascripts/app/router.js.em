App.Router.map ->
  @route('login')

  @route('index', { path: '/' })
  @route('tag', { path: '/tag' })

  @resource 'done', { path: '/done/:tagged_item_id' }, ->
    @resource 'world', { path: '/world/:item_id' }
  ***REMOVED*** @route('notes')

App.Router.reopen
  location: 'none'
