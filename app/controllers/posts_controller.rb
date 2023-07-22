class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = params[:id]
  end
end
