# TOTAL PLAYGROUND. EVERYTHING SHOULD BE REWRITTEN!
class TmdbMovieService
  create_network_by_title: (title) ->
    $.getJSON "http://moviz.dev/movies/search/#{title}", (data) =>
      movie_node = @create_movie_by_json(data.movie)
      graph.add_node(movie_node)
      similar_nodes = (@create_movie_by_json(movie) for movie in movie_node.similar)
      for movie, i in similar_nodes
        if i < 4
          graph.add_node(movie)
          graph.add_edges([new Edge(graph.get_node_index(movie_node), graph.get_node_index(movie), 1)])
          @create_network_by_id(movie.id, 2)

  create_network_by_id: (id, create_index) ->
    $.getJSON "http://moviz.dev/movies/#{id}", (data) =>
      movie_node = @create_movie_by_json(data.movie)
      graph.add_node(movie_node)
      similar_nodes = (@create_movie_by_json(movie) for movie in movie_node.similar)
      for movie, i in similar_nodes
        if i < 4
          graph.add_node(movie)
          graph.add_edges([new Edge(graph.get_node_index(movie_node), graph.get_node_index(movie), 1)])
          if create_index > 0
            @create_network_by_id(movie.id, create_index - 1)

  create_movie_by_json: (json) ->
    return new MovieNode(
      json.id,
      json.title,
      (if json.similar_movies is undefined then [] else json.similar_movies.results)
    )

window.TmdbMovieService = new TmdbMovieService
