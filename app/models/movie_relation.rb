class MovieRelation < ActiveRecord::Base
  attr_accessible :movie, :related_movie

  belongs_to :movie
  belongs_to :related_movie, :class_name => "Movie"

  class << self
    def between(movie, related_movie)
      new(:movie_id => movie, :related_movie => related_movie)
    end
  end
end
