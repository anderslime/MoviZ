class RoviMovieService
  create_network_by_title: (title) ->
    $.getJSON "http://moviz.dev/movies/search/#{title}", (data) =>
      console.log(data)
      movie_node = @create_movie_by_json(data.movie)
      graph.add_node(movie_node)
      similar_nodes = (@create_movie_by_json(movie) for movie in movie_node.similar)
      similar_nodes.sort((a,b) ->
        return -1 if a.rating > b.rating
        return 0 if a.rating == b.rating
        return 1
      )
      for movie, i in similar_nodes
        if i < 6 || graph.node_exists(movie)
          graph.add_node(movie) if i < 6
          graph.add_edges([new Edge(graph.get_node_index(movie_node), graph.get_node_index(movie), 1)])
          @create_network_by_id(movie.id, 1)

  create_network_by_id: (id, create_index) ->
    $.getJSON "http://moviz.dev/movies/#{escape(id)}", (data) =>
      movie_node = @create_movie_by_json(data.movie)
      graph.add_node(movie_node)
      similar_nodes = (@create_movie_by_json(movie) for movie in movie_node.similar)
      for movie, i in similar_nodes
        if i < 6 || graph.node_exists(movie)
          graph.add_node(movie) if i < 6
          graph.add_edges([new Edge(graph.get_node_index(movie_node), graph.get_node_index(movie), 1)])
          @create_network_by_id(movie.id, create_index - 1) if create_index > 0

  create_movie_by_json: (json) ->
    return new MovieNode(
      json.ids.movieId,
      json.title,
      (if json.related is undefined then [] else json.related.similarTo),
      json.rating
    )

window.RoviMovieService = new RoviMovieService
