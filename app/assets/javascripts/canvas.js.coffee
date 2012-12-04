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
      node.released,
      node.rating,
      node.genres.join(', ')
    )
    node.hover_box = hb

  create_movie_info_box: (node) ->
    if node.large_image && node.large_image.url
      body = $("<img>").attr(
        src: node.large_image,
        class: "img-polaroid img-large"
      )
    else
      body = ""
    
    modal = new ModalBox("movie-#{node.id}", node.title, body)
    node.modal_box = modal


window.Canvas = Canvas
