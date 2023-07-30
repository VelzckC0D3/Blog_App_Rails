class Api::V1::PostsController < ApplicationController
  def index
    posts = User.find(params['user_id']).posts
    render json: posts
  rescue StandardError
    render json: { error: 'User not found' }, status: :bad_request
  end
end
