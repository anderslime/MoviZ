class NetworkMovieRelations < Struct.new(:movie_id, :network)
  MIN_NUMBER_OF_RELATIONS = 4

  class << self
    def find_relations(movie_id, network)
      new(movie_id, network).find_relations
    end
  end

  def find_relations
    network_nodes = network.nodes
    relations = []
    sorted_movie_relations.each_with_index do |movie, index|
      if index < MIN_NUMBER_OF_RELATIONS || network_nodes.include?(movie)
        relations << movie.update_unless_completed
      end
    end
    relations
  end

  def movie
    Movie.find(movie_id)
  end

  def sorted_movie_relations
    @relations ||= movie.related_movies.sort {|a,b| b[:rating] <=> a[:rating]}
  end
end
