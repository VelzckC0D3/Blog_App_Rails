class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:photo, :name, :bio, :email, :password, :current_password)
    end
  end
end
