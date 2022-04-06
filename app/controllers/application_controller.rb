class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :authenticate_user!

#  before_action :configure_permitted_parameters, if: :devise_controller? 
#  def configure_permitted_parameters 
#    devise_parameter_sanitizer.permit(:sign_up, keys: [{ profile_attributes: :id }])
#  end 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, notice: exception.message
  end

  protected 

  def is_evaluated?
    user_signed_in? && current_user.is_evaluated?
  end

  def authenticate_evaluator!
    redirect_to root_path unless user_signed_in? && current_user.is_evaluator?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end
end
