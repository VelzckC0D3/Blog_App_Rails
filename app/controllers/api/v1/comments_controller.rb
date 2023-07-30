module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

      def index
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])
        comments = post.comments
        render json: comments
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end

      def create
        token = request.headers['X-Token']
        user = User.find_by(api_token: token)
        post = Post.find(params[:post_id])

        new_comment = post.comments.new(
          text: params[:text],
          user: # Assign the found user to the comment's user
        )

        if new_comment.save
          render json: { success: 'Comment added successfully' }, status: :created
        else
          render json: { error: new_comment.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end
    end
  end
end
