class UsersController < ApplicationController
  def index
    @users = User.includes(:comments, :posts, :likes).all
  end

  def show
    @user = User.includes(:comments, :posts, :likes).find(params[:id])
    @posts = @user.all_posts
  end
end
