class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :movie_id,  :title, :related, :api_id
  self.primary_key = :movie_id

  validates_presence_of :movie_id
  
  serialize :related, Array

  # DONT USE THESE! #
  # has_many :movie_relations
  # has_many :related_movies, :through => :movie_relations
  # has_many :inverse_movie_relations, :class_name => "MovieRelation", :foreign_key => "related_movie_id"
  # has_many :inverse_related_movies, :through => :inverse_movie_relations, :source => :movie
  # # # # # # # # # #

  class << self
    def find(id)
      find_by_movie_id(id) || create_by_api_data(MovieDatabase.find_by_id(id))
    end

    def find_by_title(title)
      super(title) || find_or_create_by_api_data(MovieDatabase.find_by_title(title))
    end

    def find_or_create_by_api_data(data)
      find_by_api_data(data) || create_by_api_data(data)
    end

    def find_by_api_data(data)
      if data.present?
        Movie.find_by_movie_id(data[:movie_id])
      else
        nil
      end
    end

    def create_by_api_data(data)
      if data.present?
        create(data)
      else
        nil
      end
    end

  end

  def update_unless_completed
    if !complete?
      data = MovieDatabases.find_by_id(self.id)
      self.update_attributes(data)
    end
    self
  end

  def complete?
    self.image_url.present? && self.related.present?
  end

end
