# frozen_string_literal: true

class CreateSession
  class PrepareParams
    include Interactor

    delegate :authenticated_user, :session_params, to: :context

    def call
      context.authenticated_user = prepare_current_user
      context.fail!(errors: errors) unless authenticated_user.present?
    end

    private

    def prepare_current_user
      User.find_by(email: session_params[:email])
            &.authenticate(session_params[:password])
    end

    def errors
      [{ field: :base, message: 'Wrong credentials' }]
    end
  end
end
