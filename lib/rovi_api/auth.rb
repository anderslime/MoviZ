module RoviApi
  class Auth < Struct.new(:sig)
    require 'digest/md5'
    API_KEY_DEVELOPMENT    = "647agh56urckjcwsqjugsx4f"
    SECRET_KEY_DEVELOPMENT = "9kbBCmCFaF"

    API_KEY_PRODUCTION     = "xgsmb76ggu6sjy78y9ayysad"
    SECRET_KEY_PRODUCTION  = "vvs78gtPBU"

    class << self
      def generate
        new(generate_sig)
      end

      def generate_sig
        Digest::MD5.hexdigest("#{api_key}#{secret_key}#{Time.now.to_i}")
      end

      def api_key
        if Rails.env == 'production'
          API_KEY_PRODUCTION
        else
          API_KEY_DEVELOPMENT
        end
      end

      def secret_key
        if Rails.env == 'production'
          SECRET_KEY_PRODUCTION
        else
          SECRET_KEY_DEVELOPMENT
        end
      end
    end

    def to_args
      { :apikey => RoviApi::Auth.api_key, :sig => sig }
    end
  end
end
