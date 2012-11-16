class Visualizer
  constructor: (@network) ->

  show_network: () ->
    initializeGraph(@graph().nodes, @graph().edges)
    $('.theater-dashboard').remove()
    @remove_curtains()

  initialize_node_count: (node_count) ->
    setTimeout(=>
      if node_count > 0 and @graph().nodes.length == node_count and @graph().all_nodes_has_images()
        $('#show-button').removeClass('btn-danger')
        $('#show-button').addClass('btn-success')
        $('#show-button').text('Show graph!')
        $('#show-button').click( => @show_network())
      else
        @initialize_node_count(@graph().nodes.length)
    ,800)

  remove_curtains: () ->
    $('.left-curtain').animate({left: '-=450'},4000)
    $('.right-curtain').animate({right: '-=450'},4000)

  graph: () ->
    @network.graph

window.netwiz.Visualizer = Visualizer
