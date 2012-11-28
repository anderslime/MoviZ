module MovieDatabases
  class RelatedMovie < Struct.new(:movie_id, :api_id, :rating)
  end
end