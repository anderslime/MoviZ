class JsonApiParser
  require 'net/http'

  class << self
    def parse_from_url(url)
      content = Net::HTTP.get_response(URI(url)).body
      JSON.parse(content)
    end

    def parse_from_url_as_block(url)
      content = Net::HTTP.get_response(URI(url)).body
      parsed_content = JSON.parse(content)
      if parsed_content['code'] == 200
        yield parsed_content
      end
    end
  end
end
