class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :movie_id,  :title
  set_primary_key :movie_id

  validates_presence_of :movie_id

  # DONT USE THESE! #
  has_many :movie_relations
  has_many :related_movies, :through => :movie_relations
  has_many :inverse_movie_relations, :class_name => "MovieRelation", :foreign_key => "related_movie_id"
  has_many :inverse_related_movies, :through => :inverse_movie_relations, :source => :movie
  # # # # # # # # # #

  def related
    related_movies + inverse_related_movies
  end

  def add_related_movie(related_movie)
    self.related_movies << related_movie
  end

end
