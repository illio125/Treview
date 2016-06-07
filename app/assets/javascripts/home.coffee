# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('div.container.home').length
    if $('div.row.travel_search').length
      travels = new Bloodhound(
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('subject')
        queryTokenizer: Bloodhound.tokenizers.whitespace
        local: $('div.travel_search').data('travels')
        # remote:
        #   url: '/travels.json?q=%QUERY'
        #   wildcard: '%QUERY'
      )

      $('.travel_search .typeahead').typeahead(
        {
          hint: true
          highlight: true
          minLength: 3
        },
        {
          name: 'travels'
          display: 'subject'
          source: travels
          limit: 99
          templates:
            empty: [
              "<div class='empty-message'>Not in the List</div>"
            ].join("\n")
            suggestion: (data) ->
              "<div>#{data.subject}</div>"
        }
      )

      $('button.search').on 'click', () ->
        input = $('input.typeahead.tt-input').val().replace(/\ /g, "-")
        unless input == ""
          window.location.href = "/videos?for=#{input}"

      $('input.tt-input').on 'keypress', (e) ->
        if(e.which == 13)
          $('button.search').click()

      $(window).resize ->
        height = $('#background').height()
        top = $('div.row.travel_search').position().top
        searchHeight = $('div.row.travel_search').height()
        marginTop = (height - searchHeight) / 2 - top
        $('div.row.travel_search').css('margin-top', marginTop)



### 인덱스 페이지 : 패럴랙스 스크롤 ###
$ ->
  if navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)
    $('#ios-notice').removeClass 'hidden'
    $('.parallax-container').height $(window).height() * 0.5 | 0
  else
    $(window).resize(->
      parallaxHeight = Math.max($(window).height() * 0.7, 200) | 0
      $('.parallax-container').height parallaxHeight
      return
    ).trigger 'resize'
  return



### 인덱스 페이지 : 타이틀 페이드인 ###

$(document).ready ->

  ### Every time the window is scrolled ... ###

  $(window).scroll ->

    ### Check the location of each desired element ###

    $('.week_title').each (i) ->
      bottom_of_object = $(this).offset().top + $(this).outerHeight()
      bottom_of_window = $(window).scrollTop() + $(window).height()

      ### If the object is completely visible in the window, fade it it ###

      if bottom_of_window > bottom_of_object
        $(this).animate { 'opacity': '1' }, 500
      return
    return
  return
