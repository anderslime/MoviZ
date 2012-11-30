module MovieDatabases
  module RoviApi
    class MovieAutocompleteURL < URL
      class << self
        def by_query(auth, query, custom_args = {})
          new(auth).api_url({ :query => query }.merge(custom_args))
        end
      end

      def api_root
        "http://api.rovicorp.com/search/v2/amgvideo/autocomplete"
      end
    end
  end
end
