# frozen_string_literal: true

class CreateUser
  include Interactor::Organizer

  organize CreateUser::SaveRecord
end
