# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('div.container.home').length
    if $('div.row.travel_search').length
      travels = new Bloodhound(
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
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
          display: 'name'
          source: travels
          limit: 99
          templates:
            empty: [
              "<div class='empty-message'>Not in the List</div>"
            ].join("\n")
            suggestion: (data) ->
              "<div>#{data.name}</div>"
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
      $(window).resize()

