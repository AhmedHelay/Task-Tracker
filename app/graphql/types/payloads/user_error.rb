# frozen_string_literal: true

module Types
  module Payloads
    class UserError < Types::BaseObject
      description 'A user-readable error'

      field :field, String, null: false, description: 'Invalid field'
      field :message, String, null: false, description: 'Error description'
    end
  end
end
