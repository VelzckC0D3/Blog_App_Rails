class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      token = generate_jwt_token(user)
      user.update(api_token: token)
      puts "Login successful for email: #{params[:email]}. Token: #{token}" # Debug output
      puts "Token: #{token}"
      render json: { api_token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def generate_jwt_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
