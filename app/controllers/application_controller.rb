class ApplicationController < ActionController::Base    
    before_action :configure_permitted_parameters, if: :devise_controller?
    add_flash_types :info , :danger , :warning , :success
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :email, :password, :current_password])
    end
  end