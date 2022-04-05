# frozen_string_literal: true

class CreateUser
  class SaveRecord
    include Interactor

    delegate :user_params, :user, to: :context

    def call
      context.user = User.new(user_params)
      context.fail!(errors: 'Invalid user data') unless context.user.save 
    end
  end
end
