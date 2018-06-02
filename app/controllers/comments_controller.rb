class CommentsController < ApplicationController
  before_action :set_user
  before_action :comment, only: [:show, :edit, :update, :destroy]
 
  def index
    @comments = @user.comments
  end

  def show
  end

  def new
    @comment = @user.comments.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @comment = @user.comment.new(comment_params)
    if @comment.save
      redirect_to [@user, @comment]
    else
      render :form
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@user, @comment]
    else
      render :form
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_comments_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
