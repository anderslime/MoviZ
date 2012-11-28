module TMDB
  module URL
    class Image < Struct.new(:file_path, :width)
      class << self
        def by_path_and_width(file_path, width)
          new(file_path, width).path
        end
      end

      def path
        [api_image_root, "w#{width}", file_path].join
      end

      private

      def api_image_root
        "http://cf2.imgobject.com/t/p/"
      end
    end
  end
end
