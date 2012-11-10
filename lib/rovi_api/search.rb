module RoviApi
  class Search
    class << self
      def find_id_by_title(sig, title)
        url = RoviApi::URL.info_url(sig, {:movie => title})
        info_hash = JsonApiParser.parse_from_url(url)
        if info_hash['code'] == 200
          info_hash['movie']['ids']['movieId'].gsub(' ','+')
        else
          nil
        end
      end
    end
  end
end
