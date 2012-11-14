class RoviMovieService

  constructor: (@network) ->

  create_network_by_title: (title) ->
    $.getJSON "/movies/search/#{title}", (data) =>
      @create_movie_by_data(data, 2)

  create_network_by_id: (id, create_index) ->
    $.getJSON "/movies/#{escape(id)}", (data) =>
      @create_movie_by_data(data, create_index - 1)

  create_movie_by_data: (data, create_level) ->
    graph = @network.graph
    movie_node = @create_movie_by_json(data.movie)
    if graph.node_exists(movie_node)
      index = graph.get_node_index(movie_node)
      graph.nodes[index].image = movie_node.image
    else
      graph.add_node(movie_node)

    similar_movies = (@create_movie_by_json(movie) for movie in movie_node.similar)
    similar_movies.sort((a,b) ->
      return -1 if a.rating > b.rating
      return 0 if a.rating == b.rating
      return 1
    )
    if create_level > 0
      for movie, i in similar_movies
        if graph.node_with_id_exists(movie.id) || (create_level >= 1 and i < 5 )
          graph.add_node(movie)
          graph.add_edges([new netwiz.Edge(graph.get_node_index(movie_node), graph.get_node_index(movie), 1)])
          @create_network_by_id(movie.id, create_level)

  create_movie_by_json: (json) ->
    return new netwiz.Node(
      json.ids.movieId,
      json.title,
      (if json.related is undefined then [] else json.related.similarTo),
      (if json.images is undefined or json.images is null then null else json.images[0]),
      json.rating
    )

window.RoviMovieService = RoviMovieService
