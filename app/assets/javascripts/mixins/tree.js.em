mixin window.Tree
  childrenExpanded: false
  notesExpanded: false
#
#   grandparent: ~>
#     @get('parentController.parentController')
#
#   grandgrandparent: ~>
#     @get('grandparent.parentController')
#
#   route: ~>
#     if @get('grandparent')?.toString()?.match(/Map/)
#       'map'
#     else
#       'world'
