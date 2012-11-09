module RoviApi
  class Data
    class << self
      def movie_exists?(id, sig)
        info_hash(id, sig) do |info|
          info['code'] == 200
        end
      end

      def info(id, sig)
        info_hash(id, sig) do |info_hash|
          {
            :id       => info_hash['movie']['ids']['movieId'].gsub(' ','+'),
            :title    => info_hash['movie']['title'],
            :released => info_hash['movie']['releaseYear'],
            :rating   => info_hash['movie']['rating']
          }
        end
      end

      def info_hash(id, sig)
        url = RoviApi::URL.info_by_id(id, sig)
        yield JsonApiParser.parse_from_url(url)
      end

      def image_url(id, sig)
        url = RoviApi::URL.image_by_id(id, sig)
        JsonApiParser.parse_from_url_as_block(url) do |image|
          return { :image_url => image['images'][10]['url'] }
        end
      end

      def related_movie_ids(id, sig)
        url = RoviApi::URL.similar_by_id(id, sig)
        JsonApiParser.parse_from_url(url)['related']['similarTo'].each do |movie|
          yield movie['ids']['movieId'].gsub(' ','+')
        end
      end
    end
  end
end
