class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

end
