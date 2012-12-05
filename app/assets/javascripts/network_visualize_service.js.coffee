class NetworkVisualizeService
  constructor: (@api_service, @theater, @tutorial, @nerd_facts) ->

  show_network: (title) ->
    @api_service.initialize_network_from(escape(title), =>
      @nerd_facts.initialize()
      @tutorial.toggle_tutorial()
    )
    @theater.toggle_theater()
    

window.visualizer.NetworkVisualizeService = NetworkVisualizeService
