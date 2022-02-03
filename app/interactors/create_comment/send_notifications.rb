# frozen_string_literal: true

class CreateComment
  class SendNotifications
    include Interactor

    delegate :comment, :current_user, to: :context

    def call
      create_avtivity
    end

    private

    def create_avtivity
      RegisterActivityJob.perform_later(current_user.id, 'Comment Created', comment.id, 'Comment')
    end
  end
end
