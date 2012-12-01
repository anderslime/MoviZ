module MovieDatabases
  class Rovi < MovieDatabases::Base

    STD_MOVIE_ARGS = { :include => 'related,images'}
    STD_AUTOCOMPLETE_ARGS = { :entitytype => 'movie', :size => "5", :format => 'json'}

    class << self

      def find_by_id(id, args = STD_MOVIE_ARGS)
        auth = MovieDatabases::RoviApi::Auth.generate
        url = MovieDatabases::RoviApi::MovieURL.by_id(auth, rovify(id), args)
        rubify(Rovi.parse_movie_by_url(url))
      end

      def find_by_title(title, args = STD_MOVIE_ARGS)
        auth = MovieDatabases::RoviApi::Auth.generate
        url = MovieDatabases::RoviApi::MovieURL.by_title(auth, title, args)
        rubify(Rovi.parse_movie_by_url(url))
      end
      def find_title_by_query(query, args = STD_AUTOCOMPLETE_ARGS)
        auth = MovieDatabases::RoviApi::AutocompleteAuth.generate
        url = MovieDatabases::RoviApi::MovieAutocompleteURL.by_query(auth, query, args)
        Rovi.parse_autocomplete_by_url(url)
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

        image_data = if data["images"].present? && !data["images"].empty?
          {
            :small => image_hash_data(data["images"].first),
            :large => image_hash_data(data["images"].last)
          }
        else
          nil
        end

        {
          movie_id:   data["ids"]["movieId"][/\d+/].to_i,
          api_id:    data["ids"]["movieId"],
          title:      data["title"],
          image_data:  image_data,
          related:    related_movies,
          rating:     data["rating"]
        }
      end

      def rovify(id)
        "V% 9d" % id
      end

      def image_hash_data(image_data)
        {
          :url => image_data["url"],
          :width => image_data["width"],
          :height => image_data["height"]
        }
      end
    end
  end
end
