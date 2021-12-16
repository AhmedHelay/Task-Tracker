# frozen_string_literal: true

module Mutations
  class CreateProject < BaseMutation
    argument :input, Types::Inputs::ProjectInput, required: true

    type Types::ProjectType

    def resolve(input:)
      result = ::CreateProject.call(
        project_params: input.to_h,
        current_user: current_user
      )
      result.project if result.success?
    end
  end
end
