module MovieDatabases
  module RoviApi
    class MovieURL < URL
      class << self
        def find(auth, custom_args)
          new(auth).api_url(custom_args)
        end

        def by_id(auth, id, args = {})
          new(auth).api_url({ :movieid => id}.merge(args))
        end

        def by_title(auth, title, args = {})
          new(auth).api_url({ :movie => title }.merge(args))
        end
      end

      private

      def api_root
        "http://api.rovicorp.com/data/v1.1/movie/info"
      end
    end
  end
end
