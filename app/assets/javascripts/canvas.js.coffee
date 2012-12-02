class Canvas

  constructor: (@d3) ->

  add_node: (node) ->
    @d3.add_node(node)
    @create_movie_info_box(node)
    @create_movie_hover_box(node)

  add_edge: (source, target) ->
    @d3.add_edge(source, target)

  repaint: ->
    @d3.restart()

  create_movie_hover_box: (node) ->
    hb = new HoverBox(
      node.id,
      node.large_image.url,
      node.title,
      "2009",
      "10",
      "Horror, Drama"
    )
    node.hover_box = hb

  create_movie_info_box: (node) ->
    modal = new ModalBox("movie-#{node.id}", node.title)
    node.modal_box = modal
    modal.body.append(
      $("<p>").text(node.title)
      $("<img>").attr(
        src: (if node.large_image is null then null else node.large_image.url),
        class: "img-polaroid"
      )
    )

window.Canvas = Canvas
