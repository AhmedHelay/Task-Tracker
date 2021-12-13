# frozen_string_literal: true

class CreateSession
  include Interactor::Organizer

  organize  CreateSession::PrepareParams,
            CreateSession::SaveRecord
end
