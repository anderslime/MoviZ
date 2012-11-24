class Visualizer
  bind_movie_form: () ->
    $('form#movie-form').submit(=>
      title = escape($('#title-input').val())
      service.create_network_by_title(title, 1)
      @on_submit()
      return false
    )

  on_submit: (node_count = 0) ->
    $('form#movie-form').hide()
    @show_network()

  set_button_as_complete: () ->
    $('#network-button').removeClass('btn-info')
    $('#network-button').addClass('btn-success')
    $('#network-button').button('complete')
    $('#network-button').click( => @show_network())

  show_network: () ->
    $('.theater-dashboard').remove()
    @remove_curtains()

  remove_curtains: () ->
    $('.left-curtain').animate({left: '-=450'},4000)
    $('.right-curtain').animate({right: '-=450'},4000)

window.Visualizer = Visualizer
