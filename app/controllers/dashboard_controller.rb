class DashboardController < ApplicationController
  def index
  end

  def show
    sig = RoviApi::URL.generate_sig
    movie_title = params[:id].gsub(' ','+')
    movie_id = RoviApi::Search.find_id_by_title(sig, movie_title)
    movie = RoviApi::Service.create_movie_by_id(sig, movie_id)
    movies = []
    movies << { 0 => movie }
    links = []
    print movie
    movie.related.each_with_index do |id, i|
      break if i > 5
      related_movie = RoviApi::Service.create_movie_by_id(sig, id)
      movies << related_movie
      links << {:source => 0, :target => i + 1, :value => 1}
      related_movie.related.each_with_index do |rid, i|
        if movies.map(&:id).include?(rid)
          
        else

        end
      end
    end
    @movie_graph = {
      :nodes => movies,
      :links => links
    }
    render :json => @movie_graph
  end

  def movie_already_created?(id, movie_ids)

  end
end
