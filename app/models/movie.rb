class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :movie_id,  :title, :related_string
  set_primary_key :movie_id

  validates_presence_of :movie_id

  # DONT USE THESE! #
  # has_many :movie_relations
  # has_many :related_movies, :through => :movie_relations
  # has_many :inverse_movie_relations, :class_name => "MovieRelation", :foreign_key => "related_movie_id"
  # has_many :inverse_related_movies, :through => :inverse_movie_relations, :source => :movie
  # # # # # # # # # #

  class << self
    def find(id)
      Movie.where(:movie_id => id).first.presence ||
        Movie.create_by_rovi_data(MovieDatabases::Rovi.find_by_id(id))
    end

    def find_by_title(title)
      Movie.where(:title => title).first.presence ||
        Movie.find_or_create_by_rovi_data(MovieDatabases::Rovi.find_by_title(title))
    end

    def find_or_create_by_rovi_data(data)
      Movie.find_by_rovie_data(data) || Movie.create_by_rovi_data(data)
    end

    def find_by_rovie_data(data)
      if data.present?
        Movie.find(data['ids']['movieId'])
      else
        nil
      end
    end

    def create_by_rovi_data(data)
      if data.present?
        Movie.create(Movie.movie_attributes_by_rovi_data(data))
      else
        nil
      end
    end

    def movie_attributes_by_rovi_data(data)
      {
        :movie_id => data['ids']['movieId'],
        :title => data['title'],
        :image_url => (data['images'].present? ? data['images'].last['url'] : nil),
        :rating => data['rating'],
        :related_string => data['related']['similarTo'].to_json
      }
    end
  end

  def related_movies_as_json
    return [] if related_string.nil?
    JSON.parse(related_string)
  end

  def update_unless_completed
    if !complete?
      data = MovieDatabases::Rovi.find_by_id(self.id)
      self.update_attributes(movie_attributes_by_rovi_data(data))
    end
    self
  end

  def complete?
    self.image_url.present? && self.related_string.present?
  end

end
