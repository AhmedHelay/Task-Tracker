class UserToProject
  include Interactor::Organizer

  organize  UserToProject::SaveRecord,
            UserToProject::SendNotifications
end