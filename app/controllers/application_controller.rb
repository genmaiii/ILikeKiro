class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit]
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def after_sign_out_path_for(resource)
    posts_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :display_name])
  end
end