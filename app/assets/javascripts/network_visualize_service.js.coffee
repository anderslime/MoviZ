class NetworkVisualizeService
  constructor: (@api_service, @theater) ->

  show_network: (title) ->
    @api_service.initialize_network_from(escape(title))
    @theater.toggle_theater()

window.visualizer.NetworkVisualizeService = NetworkVisualizeService
