class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  before_action :configure_account_update_params, only: [:update], if: :devise_controller?


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
