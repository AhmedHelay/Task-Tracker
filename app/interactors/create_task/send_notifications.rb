# frozen_string_literal: true

class CreateTask
  class SendNotifications
    include Interactor

    delegate :current_user, :task, to: :context

    def call
      create_avtivity
    end

    private

    def create_avtivity
      RegisterActivityJob.perform_later(current_user.id, 'Task Created', task.id, 'Task')
    end
  end
end
