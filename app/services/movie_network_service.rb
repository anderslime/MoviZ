class MovieNetworkService < Struct.new(:movie, :network)
  class << self
    def by_id(movie_id, network)
      new(Movie.find(movie_id), network)
    end

    def by_title(movie_title, network)
      new(Movie.find_by_title(movie_title), network)
    end

  end

  def related_movies_to_json_network
    { :nodes => find_related_movies, :edges => find_edges }
  end

  private

  def find_related_movies
    @movies ||= MovieRelationService.find_best_related_movies(params[:id])
  end

  def find_edges
    @edges ||= current_network.add_edges_to_related(
      movie_id, find_related_movies.map(&:id)
    )
  end
end
