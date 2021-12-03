class DestroyTask
    class SendNotifications
        include Interactor

        delegate :current_user, :task , :id, to: :context

        def call
            create_avtivity
        end

        private 

        def create_avtivity
            RegisterActivityJob.perform_now(current_user.id, "Task Destroyed", id, "Task")
        end
    end
end