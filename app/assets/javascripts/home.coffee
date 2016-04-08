# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('div#fullpage').length
    $('#fullpage').fullpage
      verticalCentered: true
      anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage']
      sectionsColor: ['#C63D0F', '#1BBC9B', '#7E8F7C', 'steelblue']
      css3: true
      afterRender: ->
        $('video').get(0).play()
