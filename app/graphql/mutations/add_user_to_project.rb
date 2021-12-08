module Mutations
  class AddUserToProject < BaseMutation
    
    argument :email, String, required: true
    argument :project_id, Integer, required: true

    type [Types::UserProjectType]

    def resolve(**params)
      # How to Get context msg
      ::AddProjectToUser.call(email: params[:email], project_id: params[:project_id])
      return ::UserProject.where(project_id: params[:project_id])
    end
  end
end