mixin window.Tree
  childrenExpanded: false
  notesExpanded: false

  grandparent: ~>
    @get('parentController.parentController')

  grandgrandparent: ~>
    @get('grandparent.parentController')

  route: ~>
    if @get('grandparent')?.toString()?.match(/Map/)
      'map'
    else
      'world'

#   actions:
#     notesAction: (param) ->
#       @toggleProperty('notesExpanded')
#       false
#
#     childrenAction: (item_id) ->
#     ***REMOVED*** nested_by_three = @get('grandparent')?.toString()?.match(/Item/)
#
#     ***REMOVED*** debugger
#     ***REMOVED*** if @get('parentController.model.siblings').isAny('id', item_id)
#       if @get('parentController.model.id') == item_id
#       ***REMOVED*** 'ha'
#         @toggleProperty('childrenExpanded')
#       else
#         console.log 'before', @get('childrenExpanded')
#         @transitionToRoute(@get('route'), item_id)
#         console.log 'after', @get('childrenExpanded')
#       ***REMOVED*** @get('parentController').@set('childrenExpanded', true)
#
#       console.log 'afterAll', @get('childrenExpanded')
#       false
