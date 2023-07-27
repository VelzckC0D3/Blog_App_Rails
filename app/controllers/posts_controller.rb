class PostsController < ApplicationController
  helper_method :current_user

  def index
    @user = User.find(params[:user_id])

    # Fetch posts for the current user only
    @posts = Post.includes(:user, comments: :user).all

    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = User.find(params[:user_id]).posts.build(post_params)
    return unless @post.save

    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
