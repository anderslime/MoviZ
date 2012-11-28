module TMDB
  class Search
    class << self
      def find_id_by_title(title)
        url = TMDB::URL::Search.by_title(title)
        results = JsonRestApi.parse_from_url(url)['results']
        if results.empty?
          nil
        else
          results[0]['id']
        end
      end
    end
  end
end
