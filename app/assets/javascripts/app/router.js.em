App.Router.map ->
  @route('index', { path: '/' })
  @route('tag', { path: '/tag' })
  @route('done', { path: '/done/:item_id' })
