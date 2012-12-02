class NetworkVisualizeService
  constructor: (@api_service, @theater, @nerd_facts) ->

  show_network: (title) ->
    @api_service.initialize_network_from(escape(title))
    @theater.toggle_theater()
    @nerd_facts.button.show()

window.visualizer.NetworkVisualizeService = NetworkVisualizeService
