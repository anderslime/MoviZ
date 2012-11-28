module MovieDatabases
  class Rovi < MovieDatabases::Base
    
    STD_ARGS = { :include => 'related,images'}

    class << self
      
      def find_by_id(id, args = STD_ARGS)
        auth = MovieDatabases::RoviAPI::Auth.generate
        url = MovieDatabases::RoviAPI::URL.by_id(auth, rovify(id), args)
        rubify(Rovi.parse_from_url(url))
      end

      def find_by_title(title, args = STD_ARGS)
        auth = MovieDatabases::RoviAPI::Auth.generate
        url = MovieDatabases::RoviAPI::URL.by_title(auth, title, args)
        rubify(Rovi.parse_from_url(url))
      end
      
      private
      
      
      def rubify(data)
        related_movies = data["related"]["similarTo"].map do |related_movie|
          {
            movie_id: related_movie["ids"]["movieId"][/\d+/].to_i,
            api_id:  related_movie["ids"]["movieId"],
            rating:   related_movie["rating"]
          }
        end
        
        image = data["images"].last["url"] if data["images"].present?
        
        {
          movie_id:   data["ids"]["movieId"][/\d+/].to_i,
          api_id:    data["ids"]["movieId"], 
          title:      data["title"],
          image_url:  image,
          related:    related_movies,
          rating:     data["rating"]
        }
      end
      
      def rovify(id)
        "V% 9d" % id
      end
      
    end
    
  end
end