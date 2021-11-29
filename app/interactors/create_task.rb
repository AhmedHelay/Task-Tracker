class CreateTask
    include Interactor::Organizer
  
    organize CreateTask::SendNotifications
end