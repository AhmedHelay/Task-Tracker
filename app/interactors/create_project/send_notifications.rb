# frozen_string_literal: true

class CreateProject
  class SendNotifications
    include Interactor

    delegate :project, :current_user, to: :context

    def call
      send_email_notification
      create_avtivity
    end

    private

    def send_email_notification
      ProjectMailer.create_project(project, current_user).deliver
    end

    def create_avtivity
      RegisterActivityJob.perform_now(current_user.id, 'Project Created', project.id, 'Project')
    end
  end
end
