class JsonRestApi
  class << self
    def parse_from_url(url)
      JSON.parse(RestClient.get(url, { :accept => 'json'}))
    end
  end
end
