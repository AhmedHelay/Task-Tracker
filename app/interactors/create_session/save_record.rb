# frozen_string_literal: true

class CreateSession
  class SaveRecord
    include Interactor

    delegate :authenticated_user, :session_id, :access_token, to: :context

    def call
      context.session_id = authenticated_user.id
      context.access_token = ::JWT.encode({
                                            sub: authenticated_user.id,
                                            exp: 1.hour
                                          }, jwt_secret, 'HS256')
    end

    private

    def jwt_secret
      ENV.fetch('JWT_SECRET')
    end
  end
end
