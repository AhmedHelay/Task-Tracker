class CreateSession
  include Interactor::Organizer

  organize  CreateSession::PrepareParams,
            CreateSession::SaveRecord            
end
