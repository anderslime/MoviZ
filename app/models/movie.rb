class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :movie_id,  :title
  set_primary_key :movie_id

  validates_presence_of :movie_id

  has_many :movie_relations
  has_many :related_movies, :through => :movie_relations

  def related_movies
    Movie.
      joins(:movie_relations).
      where(
        'movie_relations.movie_id = ? OR movie_relations.related_movie_id = ?',
        self.movie_id, self.movie_id
      )
  end
end
