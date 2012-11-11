# encoding: utf-8
module RoviApi
  module URL
    class Movie < Struct.new(:auth)
      class << self
        def find(auth, custom_args)
          new(auth).api_url('info', custom_args)
        end

        def by_id(auth, id, args = {})
          new(auth).api_url('info', { :movieid => id}.merge(args))
        end

        def by_title(auth, title, args = {})
          new(auth).api_url('info', { :movie => title }.merge(args))
        end
      end

      def api_url(attribute, custom_args)
        [
          api_root,
          attribute,
          "?",
          query_string_from_args(auth.to_args.merge(custom_args))
        ].join
      end

      private

      def query_string_from_args(hash_args)
        hash_args.map {|k,v| [k.to_s, '=', CGI::escape(v).to_s].join}.join('&')
      end

      def api_root
        "http://api.rovicorp.com/data/v1.1/movie/"
      end

      def std_args
        { :country => 'US', :language => 'en', :format => 'json' }
      end
    end
  end
end
