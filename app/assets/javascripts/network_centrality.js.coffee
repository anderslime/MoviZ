class NetworkCentrality
  constructor: (@d3graph) ->
    @centrality_box = $("#measurements")

  fetch_and_set_nerd_facts: ->
    @reset_lists()
    @show_load_animations()
    $.getJSON "/network/nerd_facts", (data) =>
      for kind, scores of data
        @hide_load_animation(kind)
        @set_highscore_list(scores, kind)

  hide_load_animation: (list_name) ->
    @centrality_box.find("##{list_name} img.load_animation").hide()

  reset_lists: ->
    @centrality_box.find("ol.highscore-list").html("")

  show_load_animations: ->
    @centrality_box.find("img.load_animation").show()

  set_highscore_list: (scores, kind) ->
    @append_score(score, kind) for score in scores

  append_score: (score, kind) ->
    canvas_graph_node = @d3graph.find_node(score.movie.movie_id)
    list = @centrality_box.find($("##{kind} ol.highscore-list"))
    list.append(
      $('<li>').append(
        canvas_graph_node.create_link(
          "#{@list_title(score.movie.title, 15)} - #{parseFloat(score.value).toFixed(2)}"
        )
        .data("id", score.movie.movie_id)
        .hover(
          () ->
            id = $(this).data('id', ) 
            $(".node-#{id}").find('.border').css("stroke", "red")
          () ->
            id = $(this).data('id')
            $(".node-#{id}").find('.border').css("stroke", "")
        )
      )
    )

  list_title: (title, length) ->
    if title.length > length
      title.substring(0,length)+"..."
    else
      title

window.NetworkCentrality = NetworkCentrality
