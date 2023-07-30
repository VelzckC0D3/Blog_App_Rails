class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # load_and_authorize_resource unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password, :role) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:photo, :name, :bio, :email, :password, :current_password, :role)
    end
  end
end
