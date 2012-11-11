class JsonApi
  require 'net/http'

  class << self
    def parse_from_url(url)
      response = Net::HTTP.get_response(URI(url))
      content = JSON.parse(response.body)
      if content['code'] != 200
        nil
      else
        content['movie']
      end
    end

    def parse_from_url_as_block(url)
      response = Net::HTTP.get_response(URI(url))
      content = JSON.parse(response.body)
      if content['code'] == 200
        yield content['movie']
      end
    end
  end
end
