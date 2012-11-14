class Visualizer
  constructor: (@network) ->

  show_network: () ->
    initializeGraph(@graph().nodes, @graph().edges)
    $('#show-button').remove()

  initialize_node_count: () ->
    setTimeout(=>
      $('#show-button .nodecount').text(@graph().nodes.length)
      @initialize_node_count()
    ,250)

  graph: () ->
    @network.graph

window.netwiz.Visualizer = Visualizer
