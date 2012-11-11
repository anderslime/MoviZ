module RoviApi
  class Movie < Struct.new(:auth)
    STD_ARGS = { :include => 'related,images'}

    class << self
      def find_by_id(auth, id, args = STD_ARGS)
        url = RoviApi::URL::Movie.by_id(auth, id, args)
        JsonApi.parse_from_url(url)
      end

      def find_by_title(auth, title, args = STD_ARGS)
        url = RoviApi::URL::Movie.by_title(auth, title, args)
        JsonApi.parse_from_url(url)
      end
    end
  end
end
