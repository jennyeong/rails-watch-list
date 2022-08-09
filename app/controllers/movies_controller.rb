class MoviesController < ApplicationController

  def list
    @lists = Movie.all
  end

  def new
    @list = List.new
  end

  def create
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    # raise
    redirect_to lists_path(@movie.list), status: :see_other
  end
end
