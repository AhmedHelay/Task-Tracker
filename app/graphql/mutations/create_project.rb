module Mutations
  class CreateProject < BaseMutation

    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(**params)
      result = ::CreateProject.call(
        project_params: params,
        current_user: current_user
      )
      result.project if result.success?
    end
  end
end
