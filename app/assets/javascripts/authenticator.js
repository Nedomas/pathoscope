App.CustomAuthenticator = Ember.SimpleAuth.Authenticators.OAuth2.ext***REMOVED***({
  authenticate: function(credentials) {
    return new Ember.RSVP.Promise(function(resolve, reject) {
      // make the request to authenticate the user at ***REMOVED***oint /v3/token
      Ember.$.ajax({
        url:  '/oauth/token',
        type: 'POST',
        data: { grant_type: 'password', username: credentials.identification, password: credentials.password }
      }).then(function(response) {
        Ember.run(function() {
          // resolve (including the account id) as the AJAX request was successful; all properties this promise resolves
          // with will be available through the session
          resolve({ access_token: response.access_token, user_id: response.user_id });
        });
      }, function(xhr, status, error) {
        Ember.run(function() {
          reject(xhr.responseText);
        });
      });
    });
  }
});
