class MovieRelation < ActiveRecord::Base
  attr_accessible :movie, :related_movie

  belongs_to :movie
  belongs_to :related_movie, :class_name => "Movie"
end
