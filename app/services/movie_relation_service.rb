class MovieRelationService < Struct.new(:movie, :network)
  MIN_NUMBER_OF_RELATIONS = 4

  class << self
    def find_best_related_movies(movie, network)
      new(movie, network).find_best_related_movies
    end
  end

  def find_best_related_movies
    [].tap do |related_movies|
      sorted_movie_relations.each_with_index do |movie, index|
        next if index >= MIN_NUMBER_OF_RELATIONS || !network_nodes.include?(movie)
        related_movies << movie.update_unless_completed
      end
    end
  end

  private

  def network_nodes
    @network_nodes ||= network.nodes
  end

  def sorted_movie_relations
    @relations ||= movie.related.sort {|a,b| b[:rating] <=> a[:rating]}
  end
end
