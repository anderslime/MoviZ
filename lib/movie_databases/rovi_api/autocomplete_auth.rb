module MovieDatabases
  module RoviApi
    class AutocompleteAuth < Auth
      require 'digest/md5'

      class << self
        def api_key
          ENV['rovi_autocomplete_api_key']
        end

        def secret_key
          ENV['rovi_autocomplete_secret_key']
        end
      end
    end
  end
end
