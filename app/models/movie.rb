class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :movie_id,  :title
  set_primary_key :movie_id

  validates_presence_of :movie_id

  has_many :movie_relations
  has_many :related_movies, :through => :movie_relations

  def related_movies
    MovieRelation.joins(:movies).where('movie_id = ? OR related_movie_id = ?', self.id, self.id)
  end
end
