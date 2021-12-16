# frozen_string_literal: true

module Types
  module Payloads
    class SignUpPayload < Types::BaseObject
      field :user, Types::UserType, null: false, method: :user
      field :errors, [Types::Payloads::UserError], null: true
    end
  end
end
