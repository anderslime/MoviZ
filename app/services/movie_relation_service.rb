class MovieRelationService < Struct.new(:movie, :network)
  MIN_NUMBER_OF_RELATIONS = 4

  class << self
    def find_best_related_movies(movie, network)
      new(movie, network).find_best_related_movies
    end
  end

  # Returns the MIN_NUMBER_OF_RELATIONS best rated related movies, plus all movies with relations to other existing movies
  def find_best_related_movies    
    [].tap do |related_movies|
      sorted_movie_relation_ids.each_with_index do |movie_id, index|
        next if index >= MIN_NUMBER_OF_RELATIONS && !network_node_ids.include?(movie_id)
        related_movies << Movie.find(movie_id)
      end
    end
  end

  private

  # Returns all ids for nodes in the current network
  def network_node_ids
    @network_nodes = network.node_ids
  end

  # Returns all ids for related movies sorted by ratung
  def sorted_movie_relation_ids
    @relations ||= movie.related.sort {|a,b| b[:rating] <=> a[:rating]}.map{|m| m[:movie_id]}
  end
  
end
