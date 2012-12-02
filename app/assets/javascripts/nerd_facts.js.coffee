class NerdFacts

  constructor: (@box_id, @d3graph)->
    @nerd_box = $("##{@box_id}")
    @button   = @nerd_box.find("a#nerd_facts_show_hide")
    @shown    = false

  fetch_and_set_nerd_facts: ->
    $.getJSON "/network/nerd_facts", (data) =>
      @reset_lists()
      for kind, scores of data
        @set_highscore_list(scores, kind)

  set_highscore_list: (scores, kind) ->
    @hide_load_animation(kind)
    @append_score(score, kind) for score in scores

  append_score: (score, kind) ->
    canvas_graph_node = @d3graph.find_node(score.movie.movie_id)
    list = @nerd_box.find($("##{kind} ol.highscore-list"))
    list.append(
      $('<li>').append(
        canvas_graph_node.create_link(
          "#{@list_title(score.movie.title, 15)} - #{parseFloat(score.value).toFixed(2)}"
        )
      )
    )

  list_title: (title, length) ->
    if title.length > length
      title.substring(0,length)+"..."
    else
      title

  hide_load_animation: (list_name) ->
    @nerd_box.find("##{list_name} img.load_animation").hide()

  reset_lists: ->
    @nerd_box.find("ol.highscore-list").html("")

  show_load_animations: ->
    @nerd_box.find("img.load_animation").show()

  bind_show_hide: (show_callback, hide_callback) ->
    @button.toggle(=>
      @show()
      show_callback()
    , =>
      @hide()
      hide_callback()
    )

  initialize: ->
    @nerd_box.show()
    @button.animate({left: '-110px'}, { duration: 'slow'})

  show: ->
    @shown = true
    @right_pixels ||= @nerd_box.css("right")
    @reset_lists()
    @show_load_animations()
    @fetch_and_set_nerd_facts()
    @set_hide_button()
    @nerd_box.animate(
      { right: '0'},
      { duration: 'slow' }
    )

  hide: ->
    @shown = false
    @set_show_button()
    @nerd_box.animate(
      { right: @right_pixels},
      { duration: 'slow' }
    )

  set_show_button: ->
    @button.html("Nerd Facts").toggleClass("btn-primary btn-danger").css("left","-110px")

  set_hide_button: ->
    @button.html("&times").toggleClass("btn-primary btn-danger").css("left", "-38px")

window.NerdFacts = NerdFacts
