module RoviApi
  class Auth < Struct.new(:sig)
    require 'digest/md5'
    API_KEY = "xgsmb76ggu6sjy78y9ayysad"
    SECRET_KEY = "vvs78gtPBU"

    class << self
      def generate
        new(generate_sig)
      end

      def generate_sig
        Digest::MD5.hexdigest("#{API_KEY}#{SECRET_KEY}#{Time.now.to_i}")
      end
    end

    def api_key
      API_KEY
    end

    def secret_key
      SECRET_KEY
    end

    def to_args
      { :apikey => API_KEY, :sig => sig }
    end
  end
end
