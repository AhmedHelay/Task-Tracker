# frozen_string_literal: true

module Mutations
  class AddUserToProject < BaseMutation
    argument :email, String, required: true
    argument :project_id, Integer, required: true

    type [Types::ProjectType]

    def resolve(**params)
      result = ::AddProjectToUser.call(email: params[:email], project_id: params[:project_id])

      if result.success?
        result.project
      else
        result.error
      end
    end
  end
end
