class MovieNetworkService
  class << self
    def find_related_movies(movie_id)
      related_nodes = NetworkMovieRelations.find_relations(params[:id])
      edges = current_network.add_edges_to_related(movie_id, related_nodes.map(&:id))
      nodes, edges
    end

    def find_source_movie(title)
      movie = Movie.find_by_title(title)
      current_network.add_node(movie)
      MovieNetworkService.find_related_movies(movie.id, movie.related.map(&:id))
    end
  end
end
