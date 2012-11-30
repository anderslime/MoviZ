# encoding: utf-8
module MovieDatabases
  module RoviApi
    class URL < Struct.new(:auth)

      def api_url(custom_args)
        [
          api_root,
          "?",
          query_string_from_args(auth.to_args.merge(custom_args))
        ].join
      end

      private

      def query_string_from_args(hash_args)
        hash_args.map {|k,v| [k.to_s, '=', CGI::escape(v).to_s].join}.join('&')
      end

      def api_root
        "http://www.roviurl.dk"
      end

      def std_args
        { :country => 'US', :language => 'en', :format => 'json' }
      end
    end
  end
end
