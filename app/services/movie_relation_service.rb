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
        related_movies << Movie.find(movie_id) if movie_is_relevant?(movie_id, index)
      end
    end
  end

  private

  def movie_is_relevant?(movie_id, index)
    index < MIN_NUMBER_OF_RELATIONS || network.node_ids.include?(movie_id)
  end

  # Returns all ids for related movies sorted by ratung
  def sorted_movie_relation_ids
    @relations ||= movie.related.sort {|a,b| b[:rating] <=> a[:rating]}.map{|m| m[:movie_id]}
  end
end
