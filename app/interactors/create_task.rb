class CreateTask
	include Interactor::Organizer

	organize 	CreateTask::SaveRecord,
					 	CreateTask::SendNotifications
end