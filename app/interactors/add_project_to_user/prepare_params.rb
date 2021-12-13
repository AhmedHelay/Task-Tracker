# frozen_string_literal: true

class AddProjectToUser
  class PrepareParams
    include Interactor

    delegate :email, :user, :project_id, to: :context

    def call
      context.user = User.find_by(email: email)
      context.fail!(error: 'User not found') if user.nil?
    end
  end
end
