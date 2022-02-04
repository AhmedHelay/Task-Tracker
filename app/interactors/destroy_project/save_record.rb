# frozen_string_literal: true

class DestroyProject
  class SaveRecord
    include Interactor

    delegate :project, :id, :current_user, to: :context

    def call
      context.fail!(error: 'Project destroy failed') unless project.destroy
    end
  end
end
