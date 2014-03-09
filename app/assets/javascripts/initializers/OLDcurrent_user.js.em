# Ember.Application.initializer
#   name: 'current_user'
#   initialize: (container) ->
#     store = container.lookup('store:main')
#     attributes = $('meta[name="current-user"]').attr('content')
#
#     console.log(attributes)
#     if attributes
#       user = store.push('user', store.serializerFor(App.User).normalize(App.User, JSON.parse(attributes)))
#       controller = container.lookup('controller:current_user').set('content', user)
#       container.typeInjection('controller', 'current_user', 'controller:current_user')
