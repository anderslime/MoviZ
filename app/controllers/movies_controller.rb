class MoviesController < ApplicationController
  before_filter :generate_auth_token

  def find_by_id
    #@movie = TMDB::Movie.find_by_id(params[:id])
    @movie = RoviApi::Movie.find_by_id(@auth, params[:id])
    render :json => { :movie => @movie }
  end

  def find_by_title
    #id = TMDB::Search.find_id_by_title(params[:title])
    #@movie = TMDB::Movie.find_by_id(id)
    @movie = RoviApi::Movie.find_by_title(@auth, params[:title])
    render :json => { :movie => @movie }
  end

  private

  def generate_auth_token
    @auth = RoviApi::Auth.generate
  end
end
