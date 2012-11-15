class MoviesController < ApplicationController
  before_filter :generate_auth_token

  def find_by_id
    @movie = RoviApi::Movie.find_by_id(@auth, params[:id])
    render :json => { :movie => @movie }
  end

  def find_by_title
    @movie = RoviApi::Movie.find_by_title(@auth, params[:title])
    render :json => { :movie => @movie }
  end

  private

  def generate_auth_token
    @auth = RoviApi::Auth.generate
    Rails.logger.debug("AUTH=#{@auth.inspect}")
  end
end
