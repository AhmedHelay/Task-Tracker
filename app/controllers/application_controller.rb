# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication
  rescue_from ActionPolicy::Unauthorized, with: :redirect_to_unauthorized
  rescue_from ActionController::RoutingError, with: :redirect_to_not_found

  add_flash_types :info, :danger, :warning, :success

  def not_found
    redirect_to_not_found
  end
  
  private 

  def redirect_to_unauthorized
    render template: "error_templates/not_authorized"
  end  

  def redirect_to_not_found
    render template: "error_templates/not_found"
  end
end
