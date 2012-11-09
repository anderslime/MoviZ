class DashboardController < ApplicationController
  def index
    if params[:title]
      sig = RoviApi::URL.generate_sig
      movie_title = params[:title].gsub(' ','+')
      movie_id = RoviApi::Search.find_id_by_title(movie_title, sig)
      @movie = RoviApi::Service.movie_by_id(movie_id, sig, true)
    end
  end

  def show
    
  end
end
