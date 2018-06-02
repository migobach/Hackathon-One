class UsersController < ApplicationController
  before_action :set_movie
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = @movie.users.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @user = @movie.users.new(user_params)
    if @user.save
      redirect_to [@movie, @user]
    else 
      render :form
    end
  end

  def update
    if @user.update(user_params)
      redirect_to [@movie, @user]
    else
      render :form
    end
  end

  def destroy
    @user.destroy
    redirect_to movies_path
  end

  private 

  def set_movie 
    @movie = Movie.find(params[:movie_id])
  end

  def set_user
    @user = user.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
