class Movie < ActiveRecord::Base
  attr_accessible :image_data, :rating, :movie_id,  :title, :related, :api_id,
                  :released, :director, :genres

  self.primary_key = :movie_id

  validates_presence_of :movie_id

  serialize :genres, Array
  serialize :related, Array
  serialize :image_data, Hash

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
    self.image_data.present? && self.related.present?
  end

end
