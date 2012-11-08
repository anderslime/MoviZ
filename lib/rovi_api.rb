# encoding: utf-8
module RoviApi
  class Movies < Struct.new(:sig)
    require 'digest/md5'

    class << self
      def info_url_by_id(id, sig)
        new(sig).info_url_by_id(id_to_param(id))
      end

      def info_url_by_title(title, sig)
        new(sig).info_url(title_to_param(title))
      end

      def similar_url_by_title(title, sig)
        new(sig).similar_url(title_to_param(title))
      end

      def image_url_by_title(title, sig)
        new(sig).image_url(title_to_param(title))
      end

      def generate_sig
        Digest::MD5.hexdigest("#{API_KEY}#{SECRET_KEY}#{Time.now.to_i}")
      end

      def id_to_param(id)
        "movieid=#{id}"
      end

      def title_to_param(title)
        "movie=#{title}"
      end
    end

    def info_url(search_query)
      api_url("info", search_query)
    end

    def image_url(search_query)
      api_url("images", search_query)
    end

    def similar_url(search_query)
      api_url("related", search_query)
    end

    def api_url(attribute, search_query)
      (["#{api_root}#{attribute}?#{search_query}"]+std_args+auth_args+["sig=#{sig}"]).join('&')
    end

    private

    def api_root
      "http://api.rovicorp.com/data/v1.1/movie/"
    end

    def std_args
      ["country=US", "language=en", "format=json"]
    end

    def auth_args
      ["apikey=#{API_KEY}"]
    end

    def options_to_urlstring(options)
      options.join('&')
    end

    # info?movie=Pulp+Fiction&&&&apikey=xgsmb76ggu6sjy78y9ayysad&sig=8c32e9403bcaec6ede914e84fdfd337c
    # http://api.rovicorp.com/data/v1.1/movie/related?movie=Pulp+Fiction&country=US&language=en&format=json&apikey=xgsmb76ggu6sjy78y9ayysad&sig=e82e48c74ae4832122c9f2ead325bc3c

    API_KEY = "xgsmb76ggu6sjy78y9ayysad"
    SECRET_KEY = "vvs78gtPBU"
  end

end
