module Resolvers
  class ProjectUsers < Resolvers::Base

    argument :project_id, Integer, required: true        
    
    type [Types::UserProjectType], null: true 

    def resolve(**params)
      ::UserProject.where(project_id: params[:project_id])
    end
  end
end
  