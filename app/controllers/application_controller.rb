class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kanji_family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kanji_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end