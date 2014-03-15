#= require jquery
jQuery ->
  scene = $('#scene')
  if scene.html() then scene.parallax()
