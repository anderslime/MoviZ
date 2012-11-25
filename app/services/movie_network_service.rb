class MovieNetworkService
  class << self
    def find_related_movies(movie_id)
      related_movies = Movie.find_related(movie_id)
      current_network.add_edges_to_related(movie_id, related_movies.map(&:id))
    end

    def find_source_movie(title)
      movie = Movie.find_by_title(title)
      MovieNetworkService.find_related_movies(movie.id, movie.related.map(&:id))
    end
  end
end
