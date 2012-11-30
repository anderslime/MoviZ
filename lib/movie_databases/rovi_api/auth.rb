module MovieDatabases
  module RoviApi
    class Auth < Struct.new(:sig)
      require 'digest/md5'


      class << self
        def generate
          new(generate_sig)
        end

        def generate_sig
          Digest::MD5.hexdigest("#{api_key}#{secret_key}#{Time.now.to_i}")
        end

        def api_key
          ENV['rovi_api_key']
        end

        def secret_key
          ENV['rovi_secret_key']
        end
      end

      def to_args
        { :apikey => self.class.api_key, :sig => sig }
      end
    end
  end
end
