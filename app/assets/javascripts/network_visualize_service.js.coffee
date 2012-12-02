class NetworkVisualizeService
  constructor: (@api_service, @theater, @nerd_facts) ->

  show_network: (title) ->
    @api_service.initialize_network_from(escape(title), =>
      @nerd_facts.initialize()
    )
    @theater.toggle_theater()

window.visualizer.NetworkVisualizeService = NetworkVisualizeService
