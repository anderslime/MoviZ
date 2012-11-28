module TMDB
  module URL
    class Movie < Struct.new(:id)
      include Helper

      class << self
        def by_id(id, args = {})
          new(id).api_url(args)
        end
      end

      def api_url(args)
        [
          api_root,
          id,
          "?",
          query_string_from_args(auth_args.merge(args))
        ].join
      end

      def api_root
        "http://api.themoviedb.org/3/movie/"
      end
    end
  end
end
