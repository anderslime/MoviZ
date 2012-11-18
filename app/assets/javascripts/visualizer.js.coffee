class Visualizer
  constructor: (@network) ->

  bind_movie_form: () ->
    $('form#movie-form').submit(=>
      title = escape($('#title-input').val())
      service.create_network_by_title(title)
      @on_submit()
      return false
    )

  on_submit: (node_count = 0) ->
    $('form#movie-form').hide()
    $('#network-state-button').show()
    setTimeout(=>
      if @graph_is_ready(node_count)
        @set_button_as_complete()
      else
        @on_submit(@graph().nodes.length)
    ,800)

  set_button_as_complete: () ->
    $('#network-button').removeClass('btn-info')
    $('#network-button').addClass('btn-success')
    $('#network-button').button('complete')
    $('#network-button').click( => @show_network())

  show_network: () ->
    initializeGraph(@graph().nodes, @graph().edges)
    $('.theater-dashboard').remove()
    @remove_curtains()

  remove_curtains: () ->
    $('.left-curtain').animate({left: '-=450'},4000)
    $('.right-curtain').animate({right: '-=450'},4000)

  graph_is_ready: (node_count) ->
    return node_count > 0 and @graph().nodes.length == node_count and @graph().all_nodes_has_images()

  graph: () ->
    @network.graph

window.Visualizer = Visualizer
