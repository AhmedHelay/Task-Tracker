# frozen_string_literal: true

module Resolvers
  class Users < Resolvers::Base
    type [Types::UserType], null: false

    def resolve(**_params)
      ::User.all
      end
  end
end
