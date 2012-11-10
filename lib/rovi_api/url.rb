# encoding: utf-8
module RoviApi
  class URL < Struct.new(:sig)
    require 'digest/md5'
    API_KEY = "xgsmb76ggu6sjy78y9ayysad"
    SECRET_KEY = "vvs78gtPBU"

    class << self
      def info_url(sig, *query)
        new(sig).api_url('info', query)
      end

      def generate_sig
        Digest::MD5.hexdigest("#{API_KEY}#{SECRET_KEY}#{Time.now.to_i}")
      end
    end

    def api_url(attribute, custom_args)
      "#{api_root}#{attribute}?" + query_string_from_args(custom_args)
    end

    private

    def query_string_from_args(args)
      hash_to_query_string([std_args, auth_args]+args)
    end

    def hash_to_query_string(hash_queries)
      hash_queries.inject(:merge).map {|k,v| "#{k.to_s}=#{v.to_s}"}.join('&')
    end

    def api_root
      "http://api.rovicorp.com/data/v1.1/movie/"
    end

    def std_args
      { :country => 'US', :language => 'en', :format => 'json' }
    end

    def auth_args
      { :apikey => API_KEY, :sig => sig }
    end
  end

end
