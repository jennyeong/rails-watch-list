class MoviesController < ApplicationController

  def list
    @lists = List.all
  end
end
