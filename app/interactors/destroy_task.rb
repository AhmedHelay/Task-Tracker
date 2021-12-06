class DestroyTask
	include Interactor::Organizer

	organize 	DestroyTask::PrepareParams,
						DestroyTask::SaveRecord,
            DestroyTask::SendNotifications
end