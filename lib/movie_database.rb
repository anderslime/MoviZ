class MovieDatabase
  
  class << self
    delegate :find_by_id, :find_by_title, :to => :current_database
    
    def current_database=(database)
      @@current_database = database.is_a?(MovieDatabase) ? database : "MovieDatabases::#{database.to_s.classify}".constantize
    end

    def current_database
      @@current_database ||= MovieDatabases::Rovi
    end
  end
  
end
