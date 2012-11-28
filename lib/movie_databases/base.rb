module MovieDatabases
  class Base
    class << self

      def find_by_id(id, options = {})
        raise "The method #{__method__} must be implemented in all subclasses of #{MovieDatabase.name}. Missing in #{self.class.name}."
      end

      def find_by_title(title, args = {})
        raise "The method #{__method__} must be implemented in all subclasses of #{MovieDatabase.name}. Missing in #{self.class.name}."
      end

      def parse_from_url(url)
        JsonApi.parse_from_url(url)
      end

    end
  end
end
