# frozen_string_literal: true

module Mutations
  class UpdateProject < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(**params)
      result = ::UpdateProject.call(
        project_params: params,
        current_user: current_user
      )
      result.project if result.success?
    end
  end
end
