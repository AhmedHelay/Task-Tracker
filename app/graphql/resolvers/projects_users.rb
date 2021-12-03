module Resolvers
  class ProjectsUsers < Resolvers::Base

    argument :project_id, Integer, required: true        
    
    type [Types::UserType], null: false 

    def resolve(**params)
      ::User.where(projects_id: params[:project_id])
    end
  end
end
  