class NetworkCentralityHighscore
  STD_MOVIE_AMOUNT = 3

  class << self
    def to_best_movie_scores(data, amount = STD_MOVIE_AMOUNT)
      data.first(amount).map {|element| MovieScore.by_id(element[0].to_s, element[1].to_s)}
    end
  end
end
