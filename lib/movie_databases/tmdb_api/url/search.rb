module TMDB
  module URL
    class Search < Struct.new(:title)
      include Helper

      class << self
        def by_title(title, args = {})
          new(title).api_url(args)
        end
      end

      def api_url(args)
        [
          api_search_root,
          '?',
          query_string_from_args([auth_args, title_arg, args].inject(:merge))
        ].join
      end

      private

      def title_arg
        { :query => title }
      end

      def api_search_root
        "http://api.themoviedb.org/3/search/movie"
      end
    end
  end
end
