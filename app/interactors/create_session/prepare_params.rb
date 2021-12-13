class CreateSession
  class PrepareParams
    include Interactor

    delegate :authenticated_user, :session_params, to: :context

    def call
      context.authenticated_user = prepare_current_user
    end

    private

    def prepare_current_user
        context.authenticated_user= User.find_by(
          email: session_params[:email]
        )&.authenticate(session_params[:password])
    end
  end
end
