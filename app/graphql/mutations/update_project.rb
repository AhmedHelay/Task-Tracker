# frozen_string_literal: true

module Mutations
  class UpdateProject < BaseMutation
    argument :input, Types::Inputs::UpdateProjectInput, required: true

    type Types::ProjectType

    def resolve(input:)
      result = ::UpdateProject.call(
        project_params: input.to_h,
        current_user: current_user
      )
      result.project if result.success?
    end
  end
end
