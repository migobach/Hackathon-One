class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def like
    if @movie.like.nil?
      @movie.like = 1
    else
      @movie.like += 1
    end
    @movie.save
    redirect_to movie_path(@movie)
  end
  
  def dislike
    if @movie.dislike.nil?
      @movie.dislike = 1
    else
      @movie.dislike += 1
    end
    @movie.save
    redirect_to movie_path(@movie)
  end
end