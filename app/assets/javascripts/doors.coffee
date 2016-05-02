# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $container = $('#doors')
  $container.imagesLoaded().progress ->
    $container.masonry
      itemSelector: '#grid'
      columnWidth: 320
      gutterWidth: 20
      isFitWidth: true
      isAnimated: !Modernizr.csstransitions
    return
  return

$(document).ready ready
$(document).ajaxComplete ->
  $container.masonry('reloadItems').masonry()
  return