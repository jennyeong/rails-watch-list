class MoviesController < ApplicationController

  def list
    @lists = Movie.all
  end

  def new
    @list = List.new
  end

  def create
  end
end
