class RoviMovieService

  constructor: (@canvas) ->

  create_network_by_title: (title, create_index = 2) ->
    $.getJSON "/movies/search/#{title}", (data) =>
      @create_movie_by_data(data, create_index)

  create_network_by_id: (id, create_index, made_from_related = null) ->
    $.getJSON "/movies/#{escape(id)}", (data) =>
      @create_movie_by_data(data, create_index, made_from_related)

  create_movie_by_data: (data, create_level, made_from_related = null) ->
    console.log(data)
    movie_node = @create_movie_by_json(data.movie)
    node_in_graph = @canvas.find_node(movie_node)
    if node_in_graph
      node_in_graph.image = movie_node.image
    @canvas.add_node(movie_node)
    if made_from_related isnt null
      @canvas.add_edge(movie_node, made_from_related)
    @canvas.restart()

    similar_movies = (@create_movie_by_json(movie) for movie in movie_node.similar)
    similar_movies.sort((a,b) ->
      return -1 if a.rating > b.rating
      return 0 if a.rating == b.rating
      return 1
    )
    if create_level > 0
      for movie, i in similar_movies
        if @canvas.find_node(movie) || (create_level >= 1 and i < 4 )
          @create_network_by_id(movie.id, create_level - 1, movie_node)

  create_movie_by_json: (json) ->
    return new netwiz.Node(
      json.ids.movieId,
      json.title,
      (if json.related is undefined then [] else json.related.similarTo),
      (if json.images is undefined or json.images is null then null else json.images[0]),
      json.rating
    )

window.RoviMovieService = RoviMovieService
