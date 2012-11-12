class NetworkVisualizer
  constructor: (@graph) ->

  show_network: () ->
    initializeGraph(@graph.nodes, @graph.edges)
    $('#show-button').remove()

  initialize_node_count: () ->
    setTimeout(=>
      $('#show-button .nodecount').text(@graph.nodes.length)
      @initialize_node_count()
    ,500)

window.NetworkVisualizer = new NetworkVisualizer(graph)
