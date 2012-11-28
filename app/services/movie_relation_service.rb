class MovieRelationService < Struct.new(:movie, :network)
  MIN_NUMBER_OF_RELATIONS = 4

  class << self
    def find_best_related_movies(movie, network)
      new(movie, network).find_best_related_movies
    end
  end

  def find_best_related_movies
    [].tap do |related_movies|
      sorted_movie_relation_ids.each_with_index do |movie_id, index|
        next if index >= MIN_NUMBER_OF_RELATIONS && !network_node_ids.include?(movie_id)
        related_movies << Movie.find(movie_id)
      end
    end
  end

  private

  def network_node_ids
    @network_nodes ||= network.node_ids
  end

  def sorted_movie_relation_ids
    @relations ||= movie.related_movies_as_json.sort {|a,b| b['rating'] <=> a['rating']}.map{|m| m['ids']['movieId']}
  end
end
