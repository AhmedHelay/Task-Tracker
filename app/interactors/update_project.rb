# frozen_string_literal: true

class UpdateProject
  include Interactor::Organizer

  organize UpdateProject::PrepareParams,
           UpdateProject::SaveRecord,
           UpdateProject::SendNotifications
end
