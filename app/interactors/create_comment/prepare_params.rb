class CreateComment
    class PrepareParams 
        include Interactor

        delegate :comment_params, :current_user,  to: :context
        
        def call
            context.prepared_comment_params = prepare_comment_params
        end

        private

        def prepare_comment_params
            comment_params.merge(user_id: current_user.id)
        end
    end
end
