# frozen_string_literal: true

module Mutations
  class SignIn < Mutations::BaseMutation
    argument :input, Types::Inputs::SignInInput, required: true

    type Types::Payloads::SignInPayload

    def resolve(input:)
      ::CreateSession.call(session_params: input.to_h).to_h
    end
  end
end
