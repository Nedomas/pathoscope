#= require spec_helper

describe "Login feature", ->
  it "be able to login", ->
    Ember.run ->
      visit('/')
      .then ->
        expect(find('h1').text()).to.equal('Sign in')
        mockPathsApi().then ->
        login()
        .then ->
          expect(find('h1').text()).to.equal('Paths')
#         path_titles = _pathoscope.map find('.path .description > a'), (path) ->
#           $(path).text()
#
#         expect(path_titles).to.include('Aerospace')
#         expect(path_titles).to.include('Programming')
#         expect(path_titles).to.include('Create new path')
