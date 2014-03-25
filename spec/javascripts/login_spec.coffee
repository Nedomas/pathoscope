#= require spec_helper

describe "Login feature", ->
  it "be able to login", ->
    Ember.run ->
      visit('/')
      .then ->
      ***REMOVED*** debugger
        expect(find('h1').text()).to.equal('Sign in')
        mockPathsApi().then ->
        login()
        .then ->
          expect(find('h1').text()).to.equal('Paths')
