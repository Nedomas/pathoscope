class PS.Core.ItemController extends PS.ObjectController
  needs: ['application']

  +computed parentController.notesExpandedList.@each
  notesExpanded: ->
    expanded_list = @get('parentController.notesExpandedList')
    expanded_list.contains(@get('model.id'))

  +computed parentController.childrenExpanded
  childrenExpanded: ->
    if @get('parentController.model.id') == @get('model.id')
      @get('parentController.childrenExpanded')
    else
      false

  +computed model.hasChildren
  hasChildren: ->
    if @get('parentController.hasChildren') == false
      return false
    @get('model.hasChildren')

