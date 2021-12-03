class CreateProject
    class SaveRecord
      include Interactor
  
      delegate :prepared_project_params, to: :context
  
      def call
        context.project = project
        context.fail!(error: "Invalid data") unless project.save 
        add_project_to_user
      end
  
      private
  
      def project
        @project ||= Project.create(prepared_project_params)
      end

      def add_project_to_user
        user = User.find(prepared_project_params[:user_id])
        user.projects_id.push(@project.id)
        user.save!
      end
    end
  end