App.Router.map ->
  @route('index', { path: '/' })
  @route('tag', { path: '/tag' })

  @resource 'done', { path: '/done/:item_id' }, ->
    @route('notes')
