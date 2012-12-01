module MovieDatabases
  class Movie < Struct.new(:movie_id, :api_id, :title, :rating, :image_url, :related)
    class << self
      def by_rovi_data(data)
        new(*rubyfy(data).values)
      end

      def by_related_rovi_data(data)
        new(*rubyfy_related(data).values)
      end

      def rubyfy(data)
        related_movies = data["related"]["similarTo"].map do |related_movie|
          by_related_rovi_data(related_movie)
        end

        image = data["images"].last["url"] if data["images"].present?

        {
          movie_id:   data["ids"]["movieId"][/\d+/].to_i,
          api_id:     data["ids"]["movieId"],
          title:      data["title"],
          rating:     data["rating"],
          image_url:  image,
          related:    related_movies
        }
      end

      def rubyfy_related(related_data)
        {
          movie_id: related_data["ids"]["movieId"][/\d+/].to_i,
          api_id:   related_data["ids"]["movieId"],
          title:    related_data["title"],
          rating:   related_data["rating"]
        }
      end
    end
  end
end
