class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname,:username])
    devise_parameter_sanitizer.permit(:account_update, keys:[:nickname, :username, :header_img, :user_img, :description])
  end

  def auth_user
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
