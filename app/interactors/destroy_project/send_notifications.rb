class DestroyProject
    class SendNotifications
        include Interactor

        delegate :project, :current_user, :id, to: :context

        def call
            create_avtivity
        end

        private 

        def create_avtivity
            RegisterActivityJob.perform_now(current_user.id, "Project Destroyed", id, "Project")
        end
    end
end