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

$(document).ready ->
  if $('.fullpage-home').length
    $.fn.fullpage
      menu: '.navbar'
      verticalCentered: true
      resize: false
      keyboardScrolling: false  # 키보드 스크롤링
      anchors: [
        'firstPage'
        'secondPage'
        'thirdPage'
        'fourthPage'
      ]
      # navigation: true
      # navigationPosition: 'right'
      # navigationTooltips: [
      #   'firstPageTooltip'
      #   'secondPageTooltip'
      #   'thirdPageTooltip'
      #   'fourthPageTooltip'
      # ]
      css3: true
    $('video').get(0).play();  # 비디오 배경화면
  return
