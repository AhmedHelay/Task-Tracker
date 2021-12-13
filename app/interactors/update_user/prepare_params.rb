# frozen_string_literal: true

class UpdateUser
  class PrepareParams
    include Interactor

    delegate :user_params, :user, to: :context

    def call
      context.user = prepare_user
    end

    private

    def prepare_user
      User.find(user_params[:id])
    end
  end
end
