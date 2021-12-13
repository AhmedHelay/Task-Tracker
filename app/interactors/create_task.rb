# frozen_string_literal: true

class CreateTask
  include Interactor::Organizer

  organize CreateTask::SaveRecord,
           CreateTask::SendNotifications
end
