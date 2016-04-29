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
