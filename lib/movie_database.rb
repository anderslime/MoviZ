class MovieDatabase

  class << self
    # delegate :find_by_id, :find_by_title, :to => :current_database
    # DEPRECATED:
    def current_database=(database)
      @@current_database = database.is_a?(MovieDatabase) ? database : "MovieDatabases::#{database.to_s.classify}".constantize
    end
    
    def current_database
      @@current_database ||= MovieDatabases::Rovi
    end
    
    delegate :find_by_title, :to => MovieDatabases::Rovi
    
    def find_by_id(title, *args)
      rovi_data = MovieDatabases::Rovi.find_by_id(title, *args)
      tmdb_data = MovieDatabases::TMDB.find_by_id(title, *args)
      
      rovi_data.merge(tmdb_data)
    end
    
  end
end
