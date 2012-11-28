class MoviesController < ApplicationController

  def show
    Rails.logger.debug("DBG: show. network_id = #{current_network.id}")
    service = MovieNetworkService.by_id(params[:id], current_network)
    render :json => service.related_movies_to_json_network
  end

  def search
    service = MovieNetworkService.by_title(params[:title], current_network)
    render :json => service.related_movies_to_json_network
  end
end
