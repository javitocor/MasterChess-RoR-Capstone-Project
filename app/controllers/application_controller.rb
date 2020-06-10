class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # rubocop:disable  Layout/LineLength

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar, :cover_photo, :username, :fullname, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :cover_photo, :username, :fullname, :email, :password, :current_password) }
  end
end
# rubocop:enable  Layout/LineLength
