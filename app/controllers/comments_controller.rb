class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment save successfully.'
    else
      render :new, alert: 'Error: Comment could not be saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
