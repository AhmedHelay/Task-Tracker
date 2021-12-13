# frozen_string_literal: true

class UpdateComment
  class SendNotifications
    include Interactor

    delegate :comment, :current_user, to: :context

    def call
      create_avtivity
    end

    private

    def create_avtivity
      RegisterActivityJob.perform_now(current_user.id, 'Comment Updated', comment.id, 'Comment')
    end
  end
end
