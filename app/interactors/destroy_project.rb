# frozen_string_literal: true

class DestroyProject
  include Interactor::Organizer

  organize DestroyProject::PrepareParams,
           DestroyProject::SaveRecord
end
