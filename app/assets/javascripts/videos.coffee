# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('div.container.video').length
    player = videojs 'video_id',
              controls: false
              preload: "auto"
              width: "100%"
              height: "100%"
              poster: ""
              techOrder: ["youtube"]
              youtube:
                ytControls: 2
                iv_load_policy: 1
                showinfo: 1
                cc_load_policy: 1

    # player.ready ->
    #   player.play()

  $('a.toggle_upload').on 'click', (e) ->
    e.preventDefault()
    $('nav.upload').slideToggle('slow')

$(document).ready ->
  if $('.fullpage-video').length
    $.fn.fullpage
      menu: '.navbar'
      verticalCentered: true
      resize: false
      anchors: [
        'firstPage'
        'secondPage'
        'thirdPage'
        'fourthPage'
      ]
      navigation: true
      navigationPosition: 'right'
      navigationTooltips: [
        'firstPageTooltip'
        'secondPageTooltip'
        'thirdPageTooltip'
        'fourthPageTooltip'
      ]
      css3: false
  return
