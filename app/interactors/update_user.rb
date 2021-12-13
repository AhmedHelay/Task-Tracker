class UpdateUser
  include Interactor::Organizer

  organize UpdateUser::PrepareParams,
           UpdateUser::SaveRecord
end
