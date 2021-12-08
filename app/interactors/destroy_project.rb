class DestroyProject
	include Interactor::Organizer

	organize  DestroyProject::PrepareParams,
						DestroyProject::SaveRecord
end