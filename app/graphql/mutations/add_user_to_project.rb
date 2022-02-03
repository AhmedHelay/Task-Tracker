# frozen_string_literal: true

module Mutations
  class AddUserToProject < BaseMutation
    argument :email, String, required: true
    argument :project_id, Integer, required: true

    type [Types::UserProjectType]

    def resolve(**params)
      result = ::AddProjectToUser.call(email: params[:email], project_id: params[:project_id])

      if result.success?
        result.user_project
      else
        result.errror
      end
    end
  end
end
