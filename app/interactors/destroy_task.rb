# frozen_string_literal: true

class DestroyTask
  include Interactor::Organizer

  organize DestroyTask::PrepareParams,
           DestroyTask::SaveRecord
end
