class JsonApiParser
  require 'net/http'

  class << self
    def parse_from_url(url)
      content = Net::HTTP.get_response(URI(url)).body
      JSON.parse(content)
    end
  end
end
