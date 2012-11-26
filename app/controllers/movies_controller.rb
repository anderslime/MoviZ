class MoviesController < ApplicationController

  def find_by_id
    service = MovieNetworkService.by_id(params[:id], current_network)
    render :json => service.related_movies_to_json_network
  end

  def initialize_by_title
    service = MovieNetworkService.by_title(params[:title], current_network)
    render :json => service.related_movies_to_json_network
  end
end
