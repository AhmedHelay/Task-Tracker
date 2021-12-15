# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  add_flash_types :info, :danger, :warning, :success
end
