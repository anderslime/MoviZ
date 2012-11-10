module RoviApi
  class Service
    attr_accessor :sig, :id, :catalog

    def initialize(sig, id, catalog = Catalog.new([]))
      @sig     = sig
      @id      = id
      @catalog = catalog
    end

    class << self
      def create_movie_by_id(sig, catalog, id)
        movie_info = new(sig, catalog, id).complete_info
        if movie_info.present?
          RoviMovie.new(*movie.complete_info.values)
        else
          nil
        end
      end
    end

    def complete_info
      RoviApi::MovieData.movie_info(sig, catalog, id)
    end
  end
end
