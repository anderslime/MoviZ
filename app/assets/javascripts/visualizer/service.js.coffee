class Service
  constructor: (@api_service, @theater) ->

  bind_movie_form: () ->
    $('form#movie-form').submit(=>
      title = escape($('#title-input').val())
      @api_service.initialize_network_from(title)
      @theater.toggle_theater()
      return false
    )

  # on_submit: (node_count = 0) ->
  #   $('form#movie-form').hide()
  #   @show_network()

  # show_network: () ->
  #   $('.theater-dashboard').remove()
  #   @remove_curtains()

  # toggle_theater: () ->
  #   $('form#movie-form').toggle()

  # remove_curtains: () ->
  #   $('.left-curtain').animate({left: '-=450'},4000)
  #   $('.right-curtain').animate({right: '-=450'},4000)

  # show_curtains: () ->
  #   $('.left-curtain').animate({right: '-=450'},4000)
  #   $('.right-curtain').animate({left: '-=450'},4000)

window.visualizer.Service = Service
