module MovieDatabases
  class Movie < Struct.new(:movie_id, :api_id, :title, :image_url, :related, :rating)
  end
end