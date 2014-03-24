#= require spec_helper

describe "Paths index", ->
  before ->
  ***REMOVED*** localStorage.clear()
    App.reset()

  it "shows logged paths", ->
    Ember.run ->
      mockBaseApis()
      login().then ->
        path_titles = _pathoscope.map find('.path .description > a'), (path) ->
          $(path).text()

        expect(path_titles).to.include('Aerospace')
        expect(path_titles).to.include('Programming')
        expect(path_titles).to.include('Create new path')

  it "adds a path", ->
    Ember.run ->
      mockBaseApis()
      mockPathsApiPOST()
      login().then ->
        expect(find('.path .description').length).to.equal(3)

        click('.new-path a').then ->
          expect(find('.path .description').length).to.equal(3)

          fillIn('.new-path .description input', 'Testing path')
          click('.new-path .extra button').then ->
            expect(find('.path .description').length).to.equal(4)

            path_titles = _pathoscope.map find('.path .description > a'), (path) ->
              $(path).text()
            expect(path_titles).to.include('Testing path')
