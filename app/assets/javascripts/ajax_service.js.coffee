class AjaxService

  constructor: (@canvas) ->

  initialize_network_from: (title) ->
    $.getJSON "/movies/search/#{title}.json", (data) =>
      @add_connected_nodes(data.nodes, data.edges)

  add_connected_movies: (id) ->
    $.getJSON "/movies/#{escape(id)}.json", (data) =>
      @add_connected_nodes(data.nodes, data.edges)

  add_connected_nodes: (nodes, edges) ->
    for node in nodes
      movie_node = @create_movie_by_json(node)
      @canvas.add_node(movie_node)

    for edge in edges
      @canvas.add_edge(edge.source, edge.target)

    @canvas.repaint()

  create_movie_by_json: (json) ->
    return new Node(
      json.movie_id,
      json.title,
      json.image_url
    )
window.AjaxService = AjaxService
