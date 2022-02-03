# frozen_string_literal: true

class CreateUser
  class SaveRecord
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = User.new(user_params)
      context.user.save!
    rescue ActiveRecord::RecordInvalid
      context.fail!
    end
  end
end
