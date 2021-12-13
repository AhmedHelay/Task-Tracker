# frozen_string_literal: true

class AddProjectToUser
  include Interactor::Organizer

  organize  AddProjectToUser::PrepareParams,
            AddProjectToUser::SaveRecord
end
