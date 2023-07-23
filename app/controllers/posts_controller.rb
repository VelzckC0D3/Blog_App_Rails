class PostsController < ApplicationController
  helper_method :current_user

  def index
    @user = User.find(params[:user_id])

    # Fetch posts for the current user only
    @posts = @user.posts

    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def current_user
    @current_user ||= User.first
  end

  def new
    @post = Post.new
  end

  def create
    @post = User.find(params[:user_id]).posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post saved successfully'
    else
      render :new, alert: 'Error: Post could not be saved'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
