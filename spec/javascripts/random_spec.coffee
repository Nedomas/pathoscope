#= require spec_helper
window.server = sinon.fakeServer.create()

describe "My great feature", ->
  before ->
    App.User.FIXTURES = [
      {
        "id": 1,
        "email": "having@somelaughs.com",
        "username": "Dakota",
        "note_ids": [],
        "path_ids": [ 1, 2 ],
        "item_ids": [ 3, 9, 8, 6, 5, 4, 1 ],
        "user_path_ids": [ 1 ]
      },
  ***REMOVED***

    App.Path.FIXTURES = [
      {
        "id": 1,
        "title": "Aerospace",
        "color": 1,
        "users_count": 1,
        "links_count": 5,
        "item_id": 1,
        "user_path_ids": [ 1 ],
        "chosen": true
      },
      {
        "id": 2,
        "title": "Programming",
        "color": 2,
        "users_count": 0,
        "links_count": 4,
        "item_id": 2,
        "user_path_ids": [],
        "chosen": false
        }
  ***REMOVED***

  it "will change the world", ->
    console.log('a')
    expect(true).to.equal(true)

    visit('/').then ->
      console.log('b')
    ***REMOVED*** debugger
