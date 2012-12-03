class MovieCommunityService
  class << self
    def format_communities(data)
      communities = []
      data.map do |element|
        element[1].to_enum.map do |movie_id|
          Movie.find(id.to_s).title
        end
      end
    end
  end
end
