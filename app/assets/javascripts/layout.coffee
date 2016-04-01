jQuery ->
  if $('div.flash').length
    setTimeout(
      ->
        $('div.flash').fadeOut(1000)
      5000
    )

  $(document).on 'click', 'div.flash a.flash_close', (e) ->
    e.preventDefault()
    $('div.flash').fadeOut(1000)

  # if $('div.form-group select').length
  #   $('div.form-group select').addClass('form-control')

  if $('div.row.search').length
    $(window).resize ->
      height = $('div#background').height()
      top = $('div.row.search').position().top
      searchHeight = $('div.row.search').height()
      marginTop = (height - searchHeight) / 2 - top
      $('div.row.search').css('margin-top', marginTop)
    $(window).resize()


