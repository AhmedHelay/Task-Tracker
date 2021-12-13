# frozen_string_literal: true

class CreateProject
  include Interactor::Organizer

  organize CreateProject::SaveRecord,
           CreateProject::SendNotifications
end
