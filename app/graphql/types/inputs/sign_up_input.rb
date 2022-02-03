# frozen_string_literal: true

module Types
  module Inputs
    class SignUpInput < Types::BaseInputObject
      argument :email, Email, required: true
      argument :username, String, required: true
      argument :password, String, required: true
    end
  end
end
