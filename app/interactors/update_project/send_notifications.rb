# frozen_string_literal: true

class UpdateProject
  class SendNotifications
    include Interactor

    delegate :project, :current_user, to: :context

    def call
      send_email_notification
      create_avtivity
    end

    private

    def send_email_notification
      ProjectMailer.update_project(project, current_user).deliver
    end

    def create_avtivity
      RegisterActivityJob.perform_now(current_user.id, 'Project Updated', project.id, 'Project')
    end
  end
end
