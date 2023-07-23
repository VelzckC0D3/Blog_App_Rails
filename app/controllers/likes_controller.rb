class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @post.increment!(:likes_counter)
    redirect_to user_post_path(@post.author_id, @post.id)
  end
end
