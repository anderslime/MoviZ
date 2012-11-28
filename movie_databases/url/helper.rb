module TMDB
  module URL
    module Helper
      API_KEY = "29ad3f3fae3aca8f03a1431b7b88a99f"

      def query_string_from_args(args)
        hash_to_query_string(args)
      end

      def hash_to_query_string(hash_queries)
        hash_queries.map {|k,v| [k.to_s, '=', CGI::escape(v).to_s].join}.join('&')
      end

      def auth_args
        { :api_key => API_KEY }
      end
    end
  end
end
