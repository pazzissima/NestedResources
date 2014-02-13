class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
    @comment_comments = @comment.comments
  end

  def index
    @comments = current_user.comments
  end

  def new
    @comment = Comment.new 
  end

  def create
    comment_params = params.require(:comment).permit(:body, comments_attributes: [ :body ])
    comment = current_user.comments.create(comment_params)
    redirect_to comment_path(comment.id)
  end
end
