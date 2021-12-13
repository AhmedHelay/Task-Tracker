class CreateUser
  include Interactor::Organizer

  organize  CreateUser::SaveRecord
end
