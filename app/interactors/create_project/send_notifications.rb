class CreateProject
    class SendNotifications
        include Interactor

        delegate :project, :current_user, to: :context

        def call
            send_email_notification
            create_avtivity
        end

        private 

        def send_email_notification
            ProjectMailer.project_created(project, current_user).deliver
        end

        def create_avtivity
            RegisterActivityJob.perform_now(current_user.id, "project_created", project.id, "Project")
        end
    end
end