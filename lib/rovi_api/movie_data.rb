module RoviApi
  class MovieData < Struct.new(:sig, :catalog)
    class << self
      def movie_info(sig, id, catalog = RoviApi::Catalog.new([]))
        puts sig
        puts catalog
        puts id
        new(sig, catalog).movie_info_by_id(id)
      end
    end

    def movie_info_by_id(id)
      info_hash = info_hash_by_id(id)
      if info_hash['code'] != 200
        nil
      else
        movie = info_hash['movie']
        {
          :id       => movie['ids']['movieId'].gsub(' ','+'),
          :title    => movie['title'],
          :released => movie['releaseYear'],
          :rating   => movie['rating'],
          :images   => extract_largest_image(movie['images']),
          :related  => extract_related_movies(movie['related']['similarTo'])
        }
      end
    end

    def info_hash_by_id(id)
      url = RoviApi::URL.info_url(sig, { :movieid => id, :include => 'related,images'})
      JsonApiParser.parse_from_url(url)
    end

    private

    def extract_largest_image(image_hash)
      puts "extracting images"
      return nil if image_hash.nil?
      image_hash.max {|a,b| a['height'] <=> b['height']}['url']
    end

    def extract_related_movies(related_hash)
      puts "extracting related movies"
      related_movies = []
      related_hash.each do |related_movie|
        puts related_movie
      end
      related_movies
    end
  end
end
