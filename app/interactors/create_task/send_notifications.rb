class CreateTask
    class SendNotifications
        include Interactor

        delegate :current_user, :task,  to: :context

        def call
            send_email_notification
            create_avtivity
        end

        private 

        def send_email_notification
            TaskMailer.task_created(task,Project.find(task.project_id),current_user).deliver
        end

        def create_avtivity
            RegisterActivityJob.perform_now(current_user.id, "Task Created", task.id, "Task")
        end
    end
end