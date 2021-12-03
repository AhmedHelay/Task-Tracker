class UserToProject 
    class SendNotifications
        include Interactor

        delegate :project, :current_user, to: :context

        def call
            send_email_notification
            create_avtivity
        end

        private 

        def send_email_notification
            ProjectMailer.add_user_to_project(project,current_user).deliver
        end

        def create_avtivity
            RegisterActivityJob.perform_now(current_user.id, "User added", project.id, "Project")
        end
    end
end