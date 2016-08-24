class PS.Web.ProfileRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @get('session.user')

  actions:
    save: (user) ->
      _this = this

      # validate
      password_changed = user.changedAttributes()['password']
      password_exists = user.changedAttributes()['password']?[1]?.length
      username_changed = user.changedAttributes()['username']

      if password_changed && password_exists
        if user.get('password') != user.get('passwordConfirmation')
          @flashMessage('The passwords do not match').now()
          user.rollback()
          return
        else if user.get('password').length < 8
          @flashMessage('Password is too short').now()
          user.rollback()
          return
        else
          if !username_changed
            user.save().then ->
              _this.flashMessage('New information was saved.').now()
              return



      if username_changed
        users_with_username = @store.find 'user',
          username: user.get('username')

        users_with_username.then (users) ->
          if users.get('content').length
            username = user.get('username')
            _this.flashMessage('The username "' + username + '" is already taken').now()
            user.rollback()
            return
          else
            user.save().then ->
              _this.flashMessage('New information was saved.').now()
              return
