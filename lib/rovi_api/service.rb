module RoviApi
  class Service < Struct.new(:id, :sig)
    class << self
      def movie_by_id(id, sig, with_related = false)
        movie = new(id, sig)
        if movie.exists?
          info = if with_related
            movie.fetch_all_related
          else
            movie.fetch_all
          end
          puts info.values
          RoviMovie.new(*info.values)
        else
          nil
        end
      end
    end

    def exists?
      RoviApi::Data.movie_exists?(id, sig)
    end

    def fetch_all
      [fetch_info, fetch_image].compact.inject(:merge)
    end

    def fetch_all_related
      [fetch_info, fetch_image, fetch_related].compact.inject(:merge)
    end

    def fetch_info
      RoviApi::Data.info(id, sig)
    end

    def fetch_image
      RoviApi::Data.image_url(id, sig)
    end

    def fetch_related
      related_movies = []
      i = 0
      RoviApi::Data.related_movie_ids(id, sig) do |movie_id|
        break if i > 5
        i += 1
        related_movies << RoviApi::Service.movie_by_id(movie_id, sig, false)
      end
      { :related => related_movies }
    end
  end
end
