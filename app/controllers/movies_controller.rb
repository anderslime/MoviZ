class MoviesController < ApplicationController

  def find_by_id
    @movie = MovieDatabase.find_by_id(params[:id])
    render :json => { :movie => @movie }
  end

  def find_by_title
    @movie = MovieDatabase.find_by_title(params[:title])
    render :json => { :movie => @movie }
  end

end
