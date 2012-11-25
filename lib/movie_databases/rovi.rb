module MovieDatabases
  class Rovi < MovieDatabases::Base
    
    STD_ARGS = { :include => 'related,images'}

    class << self
      
      def find_by_id(id, args = STD_ARGS)
        auth = MovieDatabases::RoviAPI::Auth.generate
        url = MovieDatabases::RoviAPI::URL.by_id(auth, id, args)
        Rovi.parse_from_url(url)
      end

      def find_by_title(title, args = STD_ARGS)
        auth = MovieDatabases::RoviAPI::Auth.generate
        url = MovieDatabases::RoviAPI::URL.by_title(auth, title, args)
        Rovi.parse_from_url(url)
      end
      
    end
    
  end
end