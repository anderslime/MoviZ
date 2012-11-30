class RoviApiParser
  require 'net/http'

  class << self
    def movie_by_url(url)
      content = content_by_url(url)
      if movie_response_succeeded?(content)
        content['movie']
      else
        nil
      end
    end

    def autocomplete_by_url(url)
      content = content_by_url(url)
      if autocomplete_response_succeeded?(content)
        encode(content['autocompleteResponse']['results'])
      else
        []
      end
    end

    private

    def content_by_url(url)
      response = Net::HTTP.get_response(URI(url))
      JSON.parse(response.body)
    end

    def movie_response_succeeded?(content)
      content['code'] == 200
    end

    def autocomplete_response_succeeded?(content)
      content['autocompleteResponse']['controlSet']['code'] == 200
    end

    def encode(string_array)
      string_array.map {|s| s.gsub(/\u00a0/,' ')}
    end
  end
end
