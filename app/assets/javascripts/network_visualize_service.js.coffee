class NetworkVisualizeService
  constructor: (@api_service, @theater, @tutorial, @nerd_facts) ->

  show_network: (title) ->
    @api_service.initialize_network_from(escape(title), =>
      @nerd_facts.initialize()
      @tutorial.show_button()
    )
    @theater.toggle_theater()
    @tutorial.toggle_tutorial()

window.visualizer.NetworkVisualizeService = NetworkVisualizeService
