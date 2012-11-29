class Canvas

  constructor: (@d3) ->

  add_node: (node) ->
    @d3.add_node(node)
    @create_movie_info_box(node)

  add_edge: (source, target) ->
    @d3.add_edge(source, target)

  repaint: ->
    @d3.restart()

  create_movie_info_box: (node) ->
    modal = new ModalBox("movie-#{node.id}", node.title)
    modal.body.append(
      $("<p>").text(node.title)
      $("<img>").attr(
        src: node.image,
        class: "img-polaroid"
      )
    )

    $("#info-container").append(modal.info_box)

window.Canvas = Canvas
