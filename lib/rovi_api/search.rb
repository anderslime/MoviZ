module RoviApi
  class Search
    class << self
      def find_id_by_title(title, sig)
        url = RoviApi::URL.info_by_title(title, sig)
        parsed_response = JsonApiParser.parse_from_url(url)
        if parsed_response['code'] == 200
          parsed_response['movie']['ids']['movieId'].gsub(' ','+')
        else
          nil
        end
      end
    end
  end
end
