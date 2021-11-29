class CreateProject
    class PrepareParams 
        include Interactor

        delegate :current_user, :project_params, to: :context
        
        def call
            context.prepared_project_params = prepare_project_params
        end

        private

        def prepare_project_params
            project_params.merge!(user_id: current_user.id)
        end
    end
end
