class Service
  constructor: (@api_service, @theater, @nerd_facts) ->

  bind_movie_form: () ->
    $('form#movie-form').submit(=>
      title = escape($('#title-input').val())
      @api_service.initialize_network_from(title)
      @theater.toggle_theater()
      @nerd_facts.button.show()
      return false
    )
    $('form#movie-form input').focus()

window.visualizer.Service = Service
