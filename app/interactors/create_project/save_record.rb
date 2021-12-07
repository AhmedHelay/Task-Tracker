class CreateProject
    class SaveRecord
      include Interactor
  
      delegate :project_params, :current_user, :project, to: :context
  
      def call
        context.project = project
        context.fail!(error: "Invalid data") unless project.save 
        AddProjectToUser.call(email: current_user.email,project_id: project.id)
      end
  
      private
  
      def project
        project = Project.create(project_params)
      end
    end
  end