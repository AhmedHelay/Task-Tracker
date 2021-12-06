class UserToProject
    class SaveRecord
      include Interactor
  
      delegate :add_user_params, to: :context
  
      def call
        add_project_to_user
      end

      private

      def add_project_to_user
        user = User.find_by(email: add_user_params[:email])
        if user.nil?
          context.fail!(error: "User not found")  
        else  
          user.projects_id.push(@project.id)
          user.save!
        end
      end
    end
  end