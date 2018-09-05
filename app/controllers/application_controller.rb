class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_permitted_parameters, if: :devise_controller?
  before_action :configure_update_permitted_parameters, if: :devise_controller?

  protected

  def configure_sign_up_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :phone_number, :avatar ])
  end

  def configure_update_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :phone_number, :avatar ])
  end
end
