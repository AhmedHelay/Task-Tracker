# frozen_string_literal: true

class UpdateUser
  include Interactor::Organizer

  organize UpdateUser::PrepareParams,
           UpdateUser::SaveRecord
end
