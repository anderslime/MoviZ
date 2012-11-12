class NetworkVisualizer
  constructor: (@graph) ->

  show_network: () ->
    initializeGraph(@graph.nodes, @graph.edges)
    $('#show-button').remove()
    RoviMovieService.stopped = true

  initialize_node_count: () ->
    setTimeout(=>
      $('#show-button .nodecount').text(@graph.nodes.length)
      @initialize_node_count()
    ,250)

window.NetworkVisualizer = new NetworkVisualizer(graph)
