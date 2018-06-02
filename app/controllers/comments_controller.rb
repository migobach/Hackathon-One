class CommentsController < ApplicationController
  before_action :set_user
  before_action :comment, only: [:show, :edit, :update, :destroy]
 
  def index
    @comments = @movie.comments
  end

  def show
  end

  def new
    @comment = @movie.comments.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to [@movie]
      binding.pry
    else
      render :form
      binding.pry
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@movie]
    else
      render :form
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_comments_path(@movie)
  end

  private

  def set_user
    @movie = Movie.find(params[:movie_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
