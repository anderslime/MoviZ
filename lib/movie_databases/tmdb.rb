module MovieDatabases
  class TMDB < MovieDatabases::Base

    class << self
      def find_by_id(id, args = {})
        auth = MovieDatabases::TmdbApi::Auth.generate
        url = MovieDatabases::TmdbApi::URL.by_id(auth, id, args)
        parse_from_url(url)
      end

      def find_by_title(title, args = {})
        url = MovieDatabases::TmdbApi::URL.by_title(auth, title, args)
        parse_from_url(url)
      end
    end
  end
end
