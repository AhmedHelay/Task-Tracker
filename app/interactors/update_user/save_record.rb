# frozen_string_literal: true

class UpdateUser
  class SaveRecord
    include Interactor

    delegate :user_params, :user, to: :context

    def call
      context.fail!(error: 'Invalid user data') unless user.update(user_params)
    end
  end
end
