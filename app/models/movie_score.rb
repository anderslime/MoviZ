class MovieScore < Struct.new(:movie, :value)
  class << self
    def by_id(id, value)
      new(Movie.find(id), value)
    end
  end
end
