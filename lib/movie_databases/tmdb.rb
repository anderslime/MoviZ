module MovieDatabases
  class TMDB < MovieDatabases::Base

    class << self
      def find_by_id(id, args = STD_ARGS)
        auth = MovieDatabases::TmdbApi::Auth.generate
        url = MovieDatabases::TmdbApi::URL.by_id(auth, id, args)
        Rovi.parse_from_url(url)
      end

      def find_by_title(title, args = STD_ARGS)
        url = MovieDatabases::TmdbApi::URL.by_title(auth, title, args)
        Rovi.parse_from_url(url)
      end
    end
  end
end
