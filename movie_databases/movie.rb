module TMDB
  class Movie
    STD_ARGS = { :append_to_response => 'similar_movies,images'}

    class << self
      def find_by_id(id, args = STD_ARGS)
        url = TMDB::URL::Movie.by_id(id, args)
        JsonRestApi.parse_from_url(url)
      end
    end
  end
end
