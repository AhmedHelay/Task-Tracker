class UpdateUser
  class SaveRecord
    include Interactor

    delegate :user_params, :user, to: :context

    def call
      context.fail!(error: 'Invalid data') unless user.update(user_params)
      user.save
    end
  end
end
