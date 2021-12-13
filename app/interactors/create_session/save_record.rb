# frozen_string_literal: true

class CreateSession
  class SaveRecord
    include Interactor

    delegate :authenticated_user, :session_id, to: :context

    def call
      if authenticated_user
        context.session_id = authenticated_user.id
      else
        context.fail!(error: 'Wrong email or password')
      end
    end
  end
end
