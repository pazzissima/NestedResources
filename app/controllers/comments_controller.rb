class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
    @comment_comments = @comment.comments
  end
end
