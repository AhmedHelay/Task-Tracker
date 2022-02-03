# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  private

  def deny_access!(error)
    redirect_back fallback_location: projects_path, alert: error.message
  end
end
